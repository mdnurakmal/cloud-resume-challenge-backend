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

<<<<<<< HEAD
data "google_project" "project" {
   project_id = var.project
=======
>>>>>>> parent of 883aea2 (Update main.tf)
}


locals {
  service_name   = "cloud-resume-challenge"
  cloud_resume_challenge_worker_sa  = "serviceAccount:${google_service_account.cloud_resume_challenge_worker.email}"
}
