output "node_group_name" {
  description = "Node group name"
  value       = aws_eks_node_group.node_group[0].node_group_name
}

output "node_group_arn" {
  description = "Node group ARN"
  value       = aws_eks_node_group.node_group[0].arn
}

# output "node_role_arn" {
#   description = "IAM Role ARN for the Node Group"
#   value       = aws_iam_role.iam_role[0].arn
# }
