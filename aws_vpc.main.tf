resource "aws_vpc" "main" {
  # checkov:skip=CKV2_AWS_12: ADD REASON
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = local.tags
}


locals {
  tags = { "Name" = upper(var.account_name) }
}
