terraform {
  backend "gcs" {
    bucket = "tfstate-arrivals-landing-page-dev"
    prefix = "terraform/state"
  }
}