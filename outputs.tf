
output "public_cidrs" {
  value       = local.public_cidrs
  description = "The CIDR ranges for your public subnets"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of your selected VPC"
}

output "vpc" {
  value       = aws_vpc.main
  description = "The Full VPC"
}

output "public_subnets" {
  value       = aws_subnet.public.*.id
  description = "The IDs of your public subnets"
}

output "public" {
  value       = aws_subnet.public
  description = "The Public Subnets"
}
