variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "akscluster" {
  description = "Azure Kubernetes Service Cluster name"
  default = "nc-cluster-001"
}