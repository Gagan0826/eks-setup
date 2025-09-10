output "cluster_name" {
  value = aws_eks_cluster.eks_cluster[0].name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster[0].endpoint
}

output "cluster_ca_certificate" {
  value = aws_eks_cluster.eks_cluster[0].certificate_authority[0].data
}

output "node_role_arn" {
  value = aws_iam_role.eks_cluster_role[0].arn
}
