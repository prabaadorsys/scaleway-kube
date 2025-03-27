terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway" # ✅ Correct provider source
      version = ">= 2.28.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "scaleway" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  project_id = var.project_id
}

module "network" {
  source     = "./modules/network"
  project_id = var.project_id
  region     = var.region
}

module "cluster" {
  source             = "./modules/cluster"
  project_id         = var.project_id
  region             = var.region
  private_network_id = module.network.private_network_id
  cluster_name       = var.cluster_name
}
