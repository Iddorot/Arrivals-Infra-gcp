variable "environment" {
  type        = string
  description = "The name of the environment"
  default     = "dev"
}

variable "project" {
  type        = string
  description = "Google Cloud Project ID"
}

variable "region" {
  type        = string
  default     = "europe-central2"
  description = "Google Cloud Region"
}

variable "service" {
  type        = string
  default     = "arrivals-landing-page"
  description = "The name of the service"
}

data "google_project" "project" {
  project_id = var.project
}

variable "github_repository_name" {
  type        = string
}