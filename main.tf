terraform {
  required_version = ">= 0.12.13"

  backend "gcs" {
#    credentials = "mbelousov7-terraform-stage.json"
    bucket  = "mbelousov7-terraform"
    prefix  = "terraform/state"
  }
}


provider "google" {
  version = "2.9.0"
  project = var.project
  region  = var.location
#  credentials = "keys/mbelousov7-terraform-stage.json"
  scopes = [
    # Default scopes
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
    "https://www.googleapis.com/auth/devstorage.full_control",

    # Required for google_client_openid_userinfo
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}


#Test
resource "google_compute_network" "our_development_network" {
  name = "terraform-network-${terraform.workspace}"
  auto_create_subnetworks = false
}
