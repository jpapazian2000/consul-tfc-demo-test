/*
data "google_service_account" "owner" {
    account_id = var.service_account
}
*/
data "google_client_config" "default" {
    }

data "google_compute_zones" "available" {
}


data "google_container_engine_versions" "supported" {
  location           = local.google_zone
  version_prefix     = var.kubernetes_version
}

resource "google_container_cluster" "gke_cluster" {
    name = var.cluster_name
    location = local.google_zone
    min_master_version = data.google_container_engine_versions.supported.latest_master_version
    initial_node_count = var.workers_count
    node_version       = data.google_container_engine_versions.supported.latest_master_version
    network    = var.network
    subnetwork = var.subnetwork

    node_locations = [
      data.google_compute_zones.available.names[1],
    ]

    ip_allocation_policy {
      cluster_ipv4_cidr_block = "/16"
      services_ipv4_cidr_block = "/22"
    }

    node_config {
    machine_type = "n1-standard-4"
    /*service_account = data.google_service_account.owner.email*/

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}