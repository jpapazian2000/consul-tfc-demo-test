resource "kubernetes_namespace" "consul_ns" {
    metadata {
      name = var.k8s_ns
    }
}

resource "helm_release" "consul" {
    depends_on = [ kubernetes_namespace.consul_ns ]
    name = "gke-consul"
    repository = "${path.module}/consul-helm"
    chart = "consul"
    namespace = kubernetes_namespace.consul_ns.metadata.0.name
    debug = true
    verify = true

}

