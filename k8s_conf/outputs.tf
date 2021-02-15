output "ui_service" {
    value = [data.kubernetes_service.consul-ui.status.0.load_balancer.0.ingress.0.hostname]
}