variable "gke_vpc_name" {
    description = "self explanatory"
}

variable "project" {
    description = "google project"
}

variable "gke_cluster_name" {
    description = "name of the cluster"
}

variable "workers_count" {
  default = "3"
}

variable "region" {
    description = "region of google"
}