output "cluster_name" {
    value = module.gke_cluster.cluster_name
}


/*
output "namespace" {
    value = kubernetes_namespace.consul.metadata[0].name
}
*/