resource "kubernetes_namespace" "consul_ns" {
    metadata {
      name = var.k8s_ns
    }
}

resource "helm_release" "consul" {
    depends_on = [ kubernetes_namespace.consul_ns ]
    name = "gke-consul"
    repository = "https://helm.releases.hashicorp.com"
    chart = "consul"
    namespace = kubernetes_namespace.consul_ns.metadata.0.name
    verify = false

    set {
      name = "ui.service.type"
      value = "LoadBalancer"
    }

}
resource "time_sleep" "wait_60s" {
  depends_on = [
    helm_release.consul
  ]
  create_duration = "1s"  
}

data "kubernetes_service" "consul-ui" {
  depends_on = [
    helm_release.consul,
    time_sleep.wait_60s
  ]
  metadata {
    name = "consul-ui"
    namespace = kubernetes_namespace.consul_ns.metadata.0.name
  }
}
