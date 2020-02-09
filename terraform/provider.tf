provider "google" {
  credentials = file("./creds/serviceaccount.json")
  project     = "microservices-264808"
  region      = "us-central1-a"
}


data "google_client_config" "default" {
}

provider "helm" {
  service_account = kubernetes_cluster_role_binding.tiller.metadata.0.name
  kubernetes {
    host                   = google_container_cluster.gke-cluster-1.endpoint
    token                  = data.google_client_config.default.access_token
    client_certificate     = base64decode(google_container_cluster.gke-cluster-1.master_auth.0.client_certificate)
    client_key             = base64decode(google_container_cluster.gke-cluster-1.master_auth.0.client_key)
    cluster_ca_certificate = base64decode(google_container_cluster.gke-cluster-1.master_auth.0.cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host                   = google_container_cluster.gke-cluster-1.endpoint
  token                  = data.google_client_config.default.access_token
  client_certificate     = base64decode(google_container_cluster.gke-cluster-1.master_auth.0.client_certificate)
  client_key             = base64decode(google_container_cluster.gke-cluster-1.master_auth.0.client_key)
  cluster_ca_certificate = base64decode(google_container_cluster.gke-cluster-1.master_auth.0.cluster_ca_certificate)
}
