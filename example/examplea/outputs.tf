
output "public_cidrs" {
  value       = module.vpc.public_cidrs
  description = "The CIDR ranges used in the public subnets"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The VPC id"
}

output "public_subnets" {
  value = module.vpc.public_subnets

  description = "The Public subnets id"
}

output "kms_key" {
  value = aws_kms_key.flowlog
}
