variable "gke_vpc_name" {
    description = "self explanatory"
}

variable "project" {
    description = "google project"
}

variable "workers_count" {
  default = "3"
}

variable "region" {
    description = "region of google"
}