variable "region" {
  description = "GCP region"
  default     = "us-west1"
}

locals {
  tags = merge({
    "Name"    = var.instance_name
    "Creator" = var.creator
    "Owner"   = var.owner
  }, var.tags)
}

provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  required_version = "~> 1.1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}