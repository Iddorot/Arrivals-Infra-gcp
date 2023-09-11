locals {
  cloudbuild_serviceaccount = "${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
  django_serviceaccount     = google_service_account.django.email
}