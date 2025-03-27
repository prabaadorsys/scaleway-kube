terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = ">= 2.28.0"
    }
  }
}

resource "scaleway_k8s_cluster" "kapsule_multi_az" {
  name               = "kapsule-multi-az"
  tags               = ["multi-az"]
  version            = "1.30"
  cni                = "cilium"
  delete_additional_resources = true
  private_network_id = var.private_network_id

  auto_upgrade {
    enable                        = true
    maintenance_window_day        = "sunday"
    maintenance_window_start_hour = 2
  }
}

resource "scaleway_k8s_pool" "pool" {
  name        = "worker-pool"
  cluster_id  = scaleway_k8s_cluster.kapsule_multi_az.id
  node_type   = "COPARM1-2C-8G"
  size        = 2  # Set worker node count to 2
  autohealing = true
}
