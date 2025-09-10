variable "vpc_enabled" {
  description = "Enable/disable the VPC module"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}