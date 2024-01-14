#Auth to google
provider "google" {
  project = var.project_id
  region  = var.region
}

# Create a GKE cluster with zero initial nodes
resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  deletion_protection= var.deletion_protection
  initial_node_count = var.initial_node_count
}

#Create a node pool with horizontal autoscaling
resource "google_container_node_pool" "primary_autoscaling_node_pool" {
  name       = var.node_pool_name
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.min_node_count

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_config {
    preemptible  = false
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
  }
}


