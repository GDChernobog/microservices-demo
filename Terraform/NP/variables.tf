variable "project_id" {
  description = "The GCP project ID"
}

variable "region" {
  description = "The region where GKE cluster and node pools will be created"
  default     = "us-central1"
}

variable "cluster_name" {
  default = "vdjurovic-cluster-np"
  description = "The name of the GKE cluster"
}

variable "node_pool_name" {
  description = "The name of the node pool"
  default     = "vdjurovic-autoscaling-node-pool"
}

variable "min_node_count" {
  description = "Minimum number of nodes in the node pool"
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes in the node pool"
  default     = 5
}

variable "machine_type" {
  description = "The machine type of the nodes"
  default     = "e2-medium"
}

variable "disk_size_gb" {
  description = "Size of the disks attached to the nodes"
  default     = 150
}

variable "deletion_protection" {
  description = "Toggle for cluster deletion protection"
  default     = false
}

variable "initial_node_count" {
  description = "The number of nodes to create in the cluster's default node pool"
  default     = 1
}