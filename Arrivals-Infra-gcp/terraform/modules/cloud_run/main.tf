
# Step 1: Create Cloud Run service

resource "google_service_account" "django" {
  account_id = "django"
}

resource "google_cloud_run_service" "service" {
  name                       = "web-${var.service}-${var.environment}"
  location                   = var.region
  autogenerate_revision_name = true

  template {
    spec {
      service_account_name = google_service_account.django.email
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project}/cloud-run-source-deploy/web-${var.service}-${var.environment}:latest"
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"      = "100"
        "run.googleapis.com/cloudsql-instances" = var.database_instance.connection_name
        "run.googleapis.com/client-name"        = "terraform"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  lifecycle {
    ignore_changes = [
      template.0.spec.0.containers.0.image
    ]
  }
}


# Step 2: Specify Cloud Run permissions
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.service.location
  project  = google_cloud_run_service.service.project
  service  = google_cloud_run_service.service.name

  policy_data = data.google_iam_policy.noauth.policy_data
}


# Step 3: Grant access to the database
resource "google_project_iam_binding" "service_permissions" {
  for_each = toset([
    "run.admin", "cloudsql.client"
  ])
  project = var.project
  role    = "roles/${each.key}"
  members = ["serviceAccount:${local.django_serviceaccount}", "serviceAccount:${local.cloudbuild_serviceaccount}"]

}

resource "google_service_account_iam_binding" "cloudbuild_sa" {
  service_account_id = google_service_account.django.name
  role               = "roles/iam.serviceAccountUser"

  members = ["serviceAccount:${local.cloudbuild_serviceaccount}"]
}
