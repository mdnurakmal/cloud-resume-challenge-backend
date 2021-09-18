# The Cloud Run service
resource "google_cloud_run_service" "cloud-resume-challenge" {
  name                       = local.service_name
  project                    = var.project
  location                   = var.region
  autogenerate_revision_name = true

  template {
    spec {
      service_account_name = google_service_account.cloud_resume_challenge_worker.email
      containers {
        image = "asia-docker.pkg.dev/${var.project}/${local.service_name}/${local.service_name}"
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }

   depends_on = [google_project_iam_binding.firestore_permmisions]
}

# Set service public
data "google_iam_policy" "auth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "auth" {
  location = google_cloud_run_service.cloud-resume-challenge.location
  project  = google_cloud_run_service.cloud-resume-challenge.project
  service  = google_cloud_run_service.cloud-resume-challenge.name
  policy_data = data.google_iam_policy.auth.policy_data
}