output "cluster_name" {
    value = module.gke_cluster.cluster_name
}

output "kubernetes_cluster_ip" {
    value = module.gke_cluster.cluster_primary_endpoint
}
/*
output "namespace" {
    value = kubernetes_namespace.consul.metadata[0].name
}
*/
output "consul-service" {
    value = module.k8s_conf.ui_service
}