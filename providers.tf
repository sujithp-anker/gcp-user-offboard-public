terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  # Project and Region can be hardcoded here or inherited from Gaia environment variables
  # project = "your-mgmt-project-id"
  # region  = "us-central1"
}