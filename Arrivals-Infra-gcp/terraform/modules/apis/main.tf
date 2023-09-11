locals {
  services = toset([
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "sts.googleapis.com",
  ])
}

resource "google_project_service" "service" {
  for_each = local.services
  project  = var.project
  service  = each.value
}

resource "google_project_service" "run" {
  service            = "run.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "sql-component" {
  service                    = "sql-component.googleapis.com"
  disable_on_destroy         = true
  disable_dependent_services = true
}

resource "google_project_service" "sqladmin" {
  service            = "sqladmin.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "compute" {
  service            = "compute.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "cloudbuild" {
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "secretmanager" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = true
}
