terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.53"
    }
  }

    backend "local" {
      config = {
      path = "/terraform"
    }
  }

}

provider "google" {}
data "google_project" "project" {
}


locals {
  project = data.google_project.project.project_id
  service_name   = "cloud-resume-challenge"
}

# Create a service account
resource "google_service_account" "cloud_resume_challenge_worker" {
  account_id   = "crc-worker-id"
  display_name = "Cloud Resume Challenge Worker"
}
