variable "cluster_name" {
  description = "EKS cluster name"
  type        = string  
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS node group"
  type        = list(string)
  default     = []
  
}

variable "eks_enabled" {
  description = "Enable/disable the EKS module"
  type        = bool
  default     = true
}
