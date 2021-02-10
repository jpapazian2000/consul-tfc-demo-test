resource "google_compute_network" "gke-vpc" {
    name = var.gke_vpc_name
    auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
    name = "${var.gke_vpc_name}-subnet"
    region = var.region
    network = google_compute_network.gke-vpc.name
    ip_cidr_range = "10.10.10.0/24"
}