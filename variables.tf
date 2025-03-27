variable "project_id" {
  description = "Scaleway Project ID"
  type        = string
}

variable "region" {
  description = "Scaleway region"
  type        = string
  default     = "fr-par"
}

variable "access_key" {
  description = "Scaleway Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Scaleway Secret Key"
  type        = string
  sensitive   = true
}

variable "cluster_name" {
  description = "Unique name for the Kubernetes cluster"
  type        = string
}
