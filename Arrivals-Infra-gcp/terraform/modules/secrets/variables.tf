variable "environment" {
  type        = string
  description = "The name of the environment"
}

variable "project" {
  type        = string
  description = "Google Cloud Project ID"
}

variable "region" {
  type        = string
  description = "Google Cloud Region"
}

variable "service" {
  type        = string
  description = "google cloud run service name"
}

variable "google_sql_user" {
  description = "sql user from database module"
}

variable "database_instance" {
  description = "sql instace value"
}
variable "google_sql_database" {
  description = "sql database value"
}

variable "google_service_account" {
  description = "google cloud run service account value"
}