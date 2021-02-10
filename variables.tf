variable "gke_vpc_name" {
    description = "self explanatory"
}

variable "project" {
    description = "google project"
}

variable "workers_count" {
  default = "3"
}

variable "cluster_name" {
    description = "name of the cluster"
}

variable "region" {
    description = "region of google"
}