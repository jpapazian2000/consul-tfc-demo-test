output "cluster_name" {
    value = module.gke_cluster.cluster_name
}

output "ip du cluster kubernetes" {
    value = module.gke_cluster.cluster_primary_endpoint
}
/*
output "namespace" {
    value = kubernetes_namespace.consul.metadata[0].name
}
*/