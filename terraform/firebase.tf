resource "google_firebase_project" "default" {
  provider = google-beta
  project  = local.project
}