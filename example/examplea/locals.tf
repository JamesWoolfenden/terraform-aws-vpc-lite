locals {
  log_name   = "${var.account_name}-flowlog"
  region     = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
}
