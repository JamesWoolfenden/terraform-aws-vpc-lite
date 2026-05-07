resource "aws_cloudwatch_log_group" "flowlog" {
  # checkov:skip=CKV_AWS_338: retention_in_days is variable-driven; consumers set the value
  name              = "${var.account_name}-flowlog"
  retention_in_days = var.log_retention_in_days
  kms_key_id        = var.kms_key.arn
}
