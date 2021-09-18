# Create a service account
resource "google_service_account" "cloud_resume_challenge_worker" {
  account_id   = "crc-worker-id"
  display_name = "Cloud Resume Challenge Worker"
}

# Github SA requires permission to access cloud run SA
# 2 seperate SA to provide finer access controls
resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = google_service_account.cloud_resume_challenge_worker.name
  role = "roles/iam.serviceAccountUser"

  members = ["serviceAccount:github@${local.project}.iam.gserviceaccount.com"]
  depends_on = [google_service_account.cloud_resume_challenge_worker]
}

# cloud function SA is running cloud function as a service account which requires serviceaccountuser permission
resource "google_project_iam_binding" "serviceAccountUser_permmisions" {

  role = "roles/iam.serviceAccountUser"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_service_account_iam_binding.admin-account-iam]
}


resource "google_project_iam_binding" "firebase_permmisions" {

  role = "roles/firebase.admin"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_project_iam_binding.serviceAccountUser_permmisions]
}

resource "google_project_iam_binding" "storage_permmisions" {

  role = "roles/firebasestorage.admin"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_project_iam_binding.firebase_permmisions]
}


resource "google_project_iam_binding" "firestore_permmisions" {

  role = "roles/firestore.serviceAgent"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_project_iam_binding.storage_permmisions]
}






