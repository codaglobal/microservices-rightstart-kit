resource "google_container_cluster" "gke-cluster-1" {
  name               = "microservices-cluster-1"
  network            = "default"
  location           = "us-central1-a"
  initial_node_count = 5
}

