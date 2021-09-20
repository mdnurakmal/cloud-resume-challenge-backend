terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.53"
    }
  }

    backend "local" {
  }

}

provider "google" {

}


locals {
  service_name   = "cloud-resume-challenge"
  cloud_resume_challenge_worker_sa  = "serviceAccount:${google_service_account.cloud_resume_challenge_worker.email}"
}
