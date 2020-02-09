locals {
  chart_path       = "../helm-charts/consul-helm-master"
  values_file_name = "/helm-consul-values.yaml"
}


resource "helm_release" "consul" {
  name  = "consul"
  chart = local.chart_path
  namespace = "consul"
	timeout = 600
  # values = [
  #   file(format("%s/%s", local.chart_path, local.values_file_name))
  # ]


  set_string {
    name = "global.datacenter"
    value = "microservices-dc-1"
  }

  # this is for development purposes only
  set_string {
    name = "ui.service.type"
    value = "LoadBalancer"
  }

  set {
    name = "syncCatalog.enabled"
    value = "true"
  }

  set {
    name = "connectInject.enabled"
    value = "true"
  }
}

# resource "helm_release" "consul" {
#   name  = "consul"
#   chart = local.chart_path
# 	timeout = 600
#   values = [
#     file(format("%s/%s", local.chart_path, local.values_file_name))
#   ]

# }
