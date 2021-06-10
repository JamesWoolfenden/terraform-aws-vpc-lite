module "vpc" {
  source       = "../../"
  cidr         = var.cidr
  zone         = var.zone
  kms_key_id   = aws_kms_key.flowlog.id
  account_name = var.account_name
}
