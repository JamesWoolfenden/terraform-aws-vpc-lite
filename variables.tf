variable "account_name" {
  type        = string
  description = "The Name of the Account"
}

variable "cidr" {
  type        = string
  description = "The range to be associated with the VPC and cleaved into the subnets"
}

variable "zone" {
  type        = list(any)
  description = "Availability zone names"
}

variable "subnets" {
  type        = number
  default     = 3
  description = "The number of subnets required, less than or equal to the number of availability zones"
}

locals {
  public_cidrs  = [cidrsubnet(var.cidr, 3, 0), cidrsubnet(var.cidr, 3, 1), cidrsubnet(var.cidr, 3, 2)]
  private_cidrs = [cidrsubnet(var.cidr, 3, 3), cidrsubnet(var.cidr, 3, 4), cidrsubnet(var.cidr, 3, 5)]
}

variable "log_retention_in_days" {
  type    = number
  default = 90
}


variable "kms_key" {
}

variable "ec2endpoint" {
  type        = number
  description = " Toggles for ec2 VPC endpoint"
  default     = 1
}

variable "s3endpoint" {
  type        = number
  description = " Toggles for s3 VPC endpoint"
  default     = 1
}
