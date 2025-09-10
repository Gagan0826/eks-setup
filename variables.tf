variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "Java-application-deployment"
}

variable "node_group_name" {
  description = "EKS node group name"
  type        = string
  default     = "Java-nodegroup"
}

variable "vpc_enabled" {
  description = "Enable/disable the VPC module"
  type        = bool
  default     = true
}

variable "eks_enabled" {
  description = "Enable/disable the EKS module"
  type        = bool
  default     = true
}

variable "node_group_enabled" {
  description = "Enable/disable the Node Group module"
  type        = bool
  default     = true
}
