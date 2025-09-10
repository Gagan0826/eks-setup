variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "node_group_name" {
  description = "Name of the Node Group"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the Node Group"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired size of the Node Group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of the Node Group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum size of the Node Group"
  type        = number
  default     = 1
}

variable "instance_types" {
  description = "EC2 instance types for the node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "capacity_type" {
  description = "Capacity type (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}

variable "node_group_enabled" {
  description = "Enable or disable the Node Group"
  type        = bool
  default     = true
}