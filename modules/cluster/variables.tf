variable "private_network_id" {}

variable "project_id" {}

variable "region" {}

variable "cluster_name" {
  description = "Unique name for the Kubernetes cluster"
  type        = string
}
