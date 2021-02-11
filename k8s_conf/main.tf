data "google_client_config" "default" {

}

provider "kubernetes" {
    host = var.cluster_endpoint
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(var.cluster_ca_cert)
}

provider "helm" {
    kubernetes {
        load_config_file = false
        host = var.cluster_endpoint
        token = data.google_client_config.default.access_token
        cluster_ca_certificate = base64decode(var.cluster_ca_cert)
    }
}