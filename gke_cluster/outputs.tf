output "project" {
    value = data.google_client_config.default.project
}
output "region" {
    value = data.google_client_config.default.region
}
output "zone" {
    value = data.google_client_config.default.zone
}

output "zones_available" {
    value = data.google_compute_zones.available.names
}

output "cluster_primary_endpoint" {
    value = google_container_cluster.gke_cluster.endpoint
}

output "certificate" {
    value = google_container_cluster.gke_cluster.master_auth.0.cluster_ca_certificate
}