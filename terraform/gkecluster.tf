resource "google_container_cluster" "gke-cluster-1" {
  name               = "microservices-cluster"
  network            = "default"
  location           = "us-central1-a"
  remove_default_node_pool = true
  initial_node_count = 1
  master_auth {
    username = ""
    password = ""

  }
}

resource "google_container_node_pool" "node-pool-1" {
  name       = "node-pool-1"
  location   = "us-central1-a"
  cluster    = google_container_cluster.gke-cluster-1.name
  node_count = 4

  autoscaling {
    max_node_count = 6
    min_node_count = 3
  }
  node_config {
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
  depends_on = [
    google_container_cluster.gke-cluster-1
  ]
}