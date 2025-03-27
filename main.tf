terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"  # ✅ Correct provider source
      version = ">= 2.28.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "scaleway" {
  region     = "fr-par"
  access_key = "SCW62ME3HXBYNJQG0A66"   # Replace with actual credentials
  secret_key = "91cec7f7-4445-4a57-9696-c778fc3adfb0"
  project_id = "5c3cd0d8-7ba0-45ad-951c-7e12c19a91fe"
}

module "network" {
  source     = "./modules/network"
  project_id = var.project_id
  region     = var.region
}

module "cluster" {
  source            = "./modules/cluster"
  project_id        = var.project_id
  region            = var.region
  private_network_id = module.network.private_network_id
}
