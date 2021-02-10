variable "kubernetes_version" {
  default = "1.18"
}

variable "cluster_name" {
    description = "name of the cluster"
}

variable "region" {
    default = "europe-west1"
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

locals {
  google_zone = data.google_compute_zones.available.names[0]
}