/*
variable "cluster_name" {
  type = string
}

variable "cluster_id" {
  type = string
}
*/
variable "cluster_endpoint" {
  type = string
}

variable "k8s_ns" {
  type = string
  description = "namespace to create for the demo"
}

variable "cluster_ca_cert" {
  type = string
}