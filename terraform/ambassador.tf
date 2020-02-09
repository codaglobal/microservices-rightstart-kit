
data "helm_repository" "datawire" {
  name = "datawire"
  url  = "https://www.getambassador.io"
}
resource "helm_release" "ambassador" {
  name    = "ambassador"
  chart = "datawire/ambassador"
  namespace = "ambassador"
  repository = data.helm_repository.datawire.metadata.0.name
}

resource "helm_release" "consul_resolver" {
  name    = "consul-resolver"
  chart   = "../helm-charts/ambassador-consul-resolver"
  namespace = "ambassador"
  depends_on = [
    helm_release.ambassador
  ]

  set {
    name = "consul.host"
    value = format("%s-consul-server.%s.svc.cluster.local", helm_release.consul.name, helm_release.consul.namespace)
  }
}