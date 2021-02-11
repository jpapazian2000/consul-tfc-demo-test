data "google_client_config" "default" {

}

provider "kubernetes" {
    host = var.cluster_endpoint
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(var.cluster_ca_cert)
}

resource "kubernetes_namespace" "consul_ns" {
    metadata {
      name = "consul_ns"
    }
}

resource "kubernetes_deployment" "consul_depl"{
    metadata {
        name = "consul_depl"
        namespace = kubernetes_namespace.consul_ns.metadata.0.name
    }
    spec {
        replicas = 2
        selector {
            match_labels = {
                app = "consul"
            }
        }
        template {
            metadata {
                labels = {
                    app = "consul"
                }
            }
            spec {
                container {
                    image = "nginx:1.19.4"
                    name = "nginx"

                    resources {
                        limits = {
                            memory = "512M"
                            cpu = "1"
                        }
                        requests = {
                            memory = "256M"
                            cpu = "50m"
                        }
                    }
                }
            }
        }
    }

}