data "google_client_config" "default" {
}

data "google_container_cluster" "my_cluster" { 
}

resource "helm_release" "nginx" {
  name        = "beta-nginx"
  repository  = "https://kubernetes.github.io/ingress-nginx"
  chart       = "ingress-nginx"
  namespace   = "default"
  set {
    name  = "controller.service.type"
    value = "NodePort"
  }
}

data "kubernetes_service" "nginx" {
  depends_on = [helm_release.nginx]
  metadata {
    name = "beta-nginx-ingress-nginx-controller"
  }
}

output "nginx_endpoint" {
  value = data.kubernetes_service.nginx
}

# variable "replica_count" {
#   type = string
#   description = "How many Nginx pods do you wish to run"
# }
