output "vpc_id" {
  value = aws_vpc.vpc[0].id
}

output "subnet_ids" {
  value = [aws_subnet.public_a[0].id, aws_subnet.public_b[0].id]
}
