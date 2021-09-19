# Create a service account
resource "google_service_account" "cloud_resume_challenge_worker" {
  project = var.project
  account_id   = "crc-worker-id"
  display_name = "Cloud Resume Challenge Worker"
}

resource "google_project_iam_binding" "firestore_permmisions" {
  project = var.project
  role = "roles/editor"

  members = [local.cloud_resume_challenge_worker_sa]
}






