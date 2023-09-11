# Step 1: Create the secrets
resource "google_storage_bucket" "assets" {
  name     = "media-${var.service}-${var.environment}"
  location = var.region
}

resource "random_password" "django_secret_key" {
  special = false
  length  = 50
}

resource "google_secret_manager_secret" "django_settings" {
  secret_id = "django_settings"

  replication {
    automatic = true
  }

}

resource "google_storage_bucket" "tfstate" {
  name          = "tfstate-${var.service}-${var.environment}"
  location      = var.region
  force_destroy = false
  versioning {
    enabled = true
  }
}

# Step 2: Prepare the secrets for Django
resource "google_secret_manager_secret_version" "django_settings" {
  secret = google_secret_manager_secret.django_settings.id

  secret_data = templatefile("${path.module}/etc/env.tpl", {
    bucket     = google_storage_bucket.assets.name
    secret_key = random_password.django_secret_key.result
    user       = var.google_sql_user
    instance   = var.database_instance
    database   = var.google_sql_database
  })
}

# Step 3: Expand Service Account permissions
resource "google_secret_manager_secret_iam_binding" "django_settings" {
  secret_id = google_secret_manager_secret.django_settings.id
  role      = "roles/secretmanager.secretAccessor"
  members   = [local.cloudbuild_serviceaccount, local.django_serviceaccount]
}

locals {
  cloudbuild_serviceaccount = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
  django_serviceaccount     = "serviceAccount:${var.google_service_account.email}"
}


# Step 3: Populate secrets
resource "random_password" "superuser_password" {
  length  = 32
  special = false
}

resource "google_secret_manager_secret" "superuser_password" {
  secret_id = "superuser_password"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "superuser_password" {
  secret      = google_secret_manager_secret.superuser_password.id
  secret_data = random_password.superuser_password.result
}

resource "google_secret_manager_secret_iam_binding" "superuser_password" {
  secret_id = google_secret_manager_secret.superuser_password.id
  role      = "roles/secretmanager.secretAccessor"
  members   = [local.cloudbuild_serviceaccount]
}
