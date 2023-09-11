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
  description = "The name of the service"
}

variable "database_instance" {
  description = "sql instace value"
}