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
}

# Create a service account
resource "google_service_account" "cloud_resume_challenge_worker" {
  project = var.project
  account_id   = "crc-worker-id"
  display_name = "Cloud Resume Challenge Worker"
}
