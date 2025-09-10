module "vpc" {
  source = "./modules/VPC"
  count  = var.vpc_enabled ? 1 : 0
  cluster_name    = var.cluster_name
  
}

module "eks" {
  source       = "./modules/EKS"
  count        = 1
  cluster_name = var.cluster_name
  subnet_ids   = module.vpc[0].subnet_ids
}

# module "node_group" {
#   source          = "./modules/Node_Group"
#   count           = var.node_group_enabled ? 1 : 0
#   cluster_name    = module.eks[0].cluster_name
#   node_group_name = var.node_group_name
#   subnet_ids      = module.vpc[0].subnet_ids
#   region          = var.region
# }

module "node_group" {
  source          = "./modules/Node_Group"
  count           = var.node_group_enabled && var.eks_enabled ? 1 : 0
  cluster_name    = var.cluster_name

  node_group_name = var.node_group_name
  subnet_ids      = module.vpc[0].subnet_ids
  instance_types  = ["t3.medium"]
  capacity_type   = "ON_DEMAND"
  tags = {
    Environment = "dev"
    Project     = "my-app"
  }
  
}

module "ECR" {
  source = "./modules/ECR"

  name                    = "java-app"
  image_tag_mutability    = "IMMUTABLE"
  scan_on_push            = true
  encryption_type         = "AES256"
  lifecycle_policy_enabled = true

  tags = {
    Environment = "dev"
    Project     = "boardgame"
  }
}