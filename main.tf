provider "google" {
  project = "jpapazian-terraform-consul-gke"
  region  = var.region
}
/*
terraform {
    required_providers {
      google {
          source = "hashicorp/google"
          version = "3.52"
      }
      kubernetes {
          source = "hashicorp/kubernetes"
          version  = ">= 2.0.0"
      }
      helm {
          source = "hashicorp/helm"
          version = ">= 2.0.1"
      }
    }
}
*/

module "gke_cluster" {
    source = "./gke_cluster"
    network    = google_compute_network.gke-vpc.name
    subnetwork = google_compute_subnetwork.subnet.name
    cluster_name = var.gke_cluster_name

}

module "kubernetes_config" {
    source = "./k8s_conf"
    cluster_endpoint = module.gke_cluster.cluster_primary_endpoint
    cluster_ca_cert = module.gke_cluster.certificate

}
