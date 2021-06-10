# terraform-aws-vpc-lite

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-vpc-lite/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-vpc-lite)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-vpc-lite.svg)](https://github.com/JamesWoolfenden/terraform-aws-vpc-lite/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-vpc-lite.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-vpc-lite/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-vpc-lite/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-vpc-lite&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-vpc-lite/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-vpc-lite&benchmark=INFRASTRUCTURE+SECURITY)

This module is to create a VPC, Sub-nets and routes for your standard AWS VPC pattern. It also implements the default tag scheme and calculates the breakdown of your CIDR.
This module defaults to creating 3 public sub-nets, or optionally less.

It does not add private subnet and NATs as this isn't designed to be a lower cost development VPC not for Production usage.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing Terraform code:

```hcl
module "vpc" {
  source       = "JamesWoolfenden/vpc-lite/aws"
  version      = "0.0.1"
  cidr         = var.cidr
  zone         = var.zone
  account_name = var.account_name
}
```

Using these as your values in your Terraform tfvars file:

```YAML
account_name = "test"
cidr         = "10.0.0.0/21"
zone         = ["A","B","C"]
```

## Costs

```text
Monthly cost estimate

Project: .

 Name                                            Monthly Qty  Unit              Monthly Cost

 aws_kms_key.flowlog
 ├─ Customer master key                                    1  months                   $1.00
 ├─ Requests                                  Cost depends on usage: $0.03 per 10k requests
 ├─ ECC GenerateDataKeyPair requests          Cost depends on usage: $0.10 per 10k requests
 └─ RSA GenerateDataKeyPair requests          Cost depends on usage: $0.10 per 10k requests

 module.vpc.aws_cloudwatch_log_group.flowlog
 ├─ Data ingested                                          0  GB                       $0.00
 ├─ Archival Storage                                       0  GB                       $0.00
 └─ Insights queries data scanned                          0  GB                       $0.00

 PROJECT TOTAL                                                                         $1.00
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.flowlog](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_flow_log.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_iam_role.flowlog](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.flowlog](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_network_acl.networkaclpublic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_route.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_endpoint.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | The Name of the Account | `string` | n/a | yes |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The range to be associated with the VPC and cleaved into the subnets | `string` | n/a | yes |
| <a name="input_ec2endpoint"></a> [ec2endpoint](#input\_ec2endpoint) | Toggles for ec2 VPC endpoint | `number` | `1` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | n/a | `string` | n/a | yes |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | n/a | `number` | `90` | no |
| <a name="input_s3endpoint"></a> [s3endpoint](#input\_s3endpoint) | Toggles for s3 VPC endpoint | `number` | `1` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The number of subnets required, less than or equal to the number of availability zones | `number` | `3` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Availability zone names | `list(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public"></a> [public](#output\_public) | The Public Subnets |
| <a name="output_public_cidrs"></a> [public\_cidrs](#output\_public\_cidrs) | The CIDR ranges for your public subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | The IDs of your public subnets |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | The Full VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of your selected VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Instructions

## Related Projects

Check out these related projects.

- [terraform-aws-codebuild](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Making a Build pipeline

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-vpc-lite/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-vpc-lite/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2021 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-vpc-lite&url=https://github.com/jameswoolfenden/terraform-aws-vpc-lite
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-vpc-lite&url=https://github.com/jameswoolfenden/terraform-aws-vpc-lite
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-vpc-lite
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-vpc-lite
[share_email]: mailto:?subject=terraform-aws-vpc-lite&body=https://github.com/jameswoolfenden/terraform-aws-vpc-lite
