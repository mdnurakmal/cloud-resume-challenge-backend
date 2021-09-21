# Create a service account
resource "google_service_account" "cloud_resume_challenge_worker" {
  project = var.project
  account_id   = "crc-worker-id"
  display_name = "Cloud Resume Challenge Worker"
}

# cloud function SA is running cloud function as a service account which requires serviceaccountuser permission
resource "google_project_iam_binding" "serviceAccountUser_permmisions" {
  project = var.project
  role = "roles/iam.serviceAccountUser"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_service_account.cloud_resume_challenge_worker]
}


resource "google_project_iam_binding" "firebase_permmisions" {
  project = var.project
  role = "roles/firebase.admin"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_project_iam_binding.serviceAccountUser_permmisions]
}

resource "google_project_iam_binding" "storage_permmisions" {
  project = var.project
  role = "roles/firebasestorage.admin"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_project_iam_binding.firebase_permmisions]
}


resource "google_project_iam_binding" "firestore_permmisions" {
  project = var.project
  role = "roles/firestore.serviceAgent"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_project_iam_binding.storage_permmisions]
}






