resource "kubernetes_namespace" "consul_ns" {
    metadata {
      name = var.k8s_ns
    }
}

resource "helm_release" "consul" {
    depends_on = [ kubernetes_namespace.consul_ns ]
    name = "gke-consul"
    repository = "https://helm.releases.hashicorp.com/consul-helm.git"
    chart = "consul-helm"
    namespace = kubernetes_namespace.consul_ns.metadata.0.name

  set {
    name  = "global.name"
    value = "consul"
  }

  set {
    name  = "server.replicas"
    value = "2"
  }

  set {
    name  = "server.bootstrapExpect"
    value = "2"
  }
}

