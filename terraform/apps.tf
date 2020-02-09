
resource "helm_release" "spring-service" {
  name    = "spring-service"
  chart   = "../charts/spring-service"
  timeout = 600
  namespace = "mrk-app"
  depends_on = [
    helm_release.ambassador,
    helm_release.consul
  ]
}

resource "helm_release" "go-service" {
  name    = "go-service"
  chart   = "../charts/go-service"
  timeout = 600
  namespace = "mrk-app"
  depends_on = [
    helm_release.ambassador,
    helm_release.consul
  ]
}

resource "helm_release" "python-service" {
  name    = "python-service"
  chart   = "../charts/python-service"
  timeout = 600
  namespace = "mrk-app"
  depends_on = [
    helm_release.ambassador,
    helm_release.consul
  ]
}
