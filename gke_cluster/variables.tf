variable "kubernetes_version" {
  default = "1.18"
}

variable "region" {
    default = "europe-west1"
}

variable "gke_cluster_name" {
    description = "name of the cluster"
}

variable "project" {
    description = "google project"
}

variable "network" {
    description = "network for the vpc"
}

variable "subnetwork" {
    description = "variable for the subnet"
}

variable "workers_count" {
  default = "3"
}

variable "cluster_name" {
  type = string
}

locals {
  google_zone = data.google_compute_zones.available.names[0]
}