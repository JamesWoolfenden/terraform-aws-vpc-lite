resource "aws_cloudwatch_log_group" "flowlog" {
  name              = "${var.account_name}-flowlog"
  retention_in_days = var.log_retention_in_days
  kms_key_id        = var.kms_key.arn
}
