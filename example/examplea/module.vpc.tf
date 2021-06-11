module "vpc" {
  source       = "../../"
  cidr         = var.cidr
  zone         = var.zone
  kms_key      = aws_kms_key.flowlog
  account_name = var.account_name
}
