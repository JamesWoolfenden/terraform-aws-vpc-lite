resource "aws_vpc_endpoint" "ec2" {
  count        = var.ec2endpoint
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.ec2"
}

resource "aws_vpc_endpoint" "s3" {
  count        = var.s3endpoint
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
}
