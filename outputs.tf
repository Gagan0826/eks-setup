# output "cluster_name" {
#   value = module.eks[0].cluster_name
# }

# output "cluster_endpoint" {
#   value = module.eks[0].cluster_endpoint
# }

# output "cluster_ca_certificate" {
#   value = module.eks[0].cluster_ca_certificate
# }

output "repository_url" {
  value = module.ECR.repository_url
}
