# Terraform AWS [iam-policy-helper]

This module is for internal use only. Current users use this module for generating policies and assume role policies using a standardized setup.

[![](we-are-technative.png)](https://www.technative.nl)

## How does it work

### First use after you clone this repository or when .pre-commit-config.yaml is updated

Run `pre-commit install` to install any guardrails implemented using pre-commit.

See [pre-commit installation](https://pre-commit.com/#install) on how to install pre-commit.

## Usage

This is an internal module so any variables can be changed at any time for any reason.

The working of this module is best demonstrated by it's current users:

- [iam-role](https://github.com/TechNative-B-V/terraform-aws-module-iam-role)
- [iam-user](https://github.com/TechNative-B-V/terraform-aws-module-iam-user)

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.customer_managed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.user_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_policy.aws_managed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_merged](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_configuration"></a> [assume\_role\_configuration](#input\_assume\_role\_configuration) | Policies for assume role. Optional. | <pre>map(object({<br>    account_id = string<br>    role_path  = string<br>  }))</pre> | `{}` | no |
| <a name="input_aws_managed_policies"></a> [aws\_managed\_policies](#input\_aws\_managed\_policies) | Optional list of AWS managed policies. We assume that these policies already exist. | `list(string)` | `[]` | no |
| <a name="input_customer_managed_policies"></a> [customer\_managed\_policies](#input\_customer\_managed\_policies) | Optional map of customer managed policy names. Key is policyname and value is policy object in HCL. | `any` | `{}` | no |
| <a name="input_principal_name"></a> [principal\_name](#input\_principal\_name) | Principal name to partition policies and to attach policies to. Required value. | `string` | n/a | yes |
| <a name="input_principal_type"></a> [principal\_type](#input\_principal\_type) | Either user or role. Required to properly attach custom and managed policies. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
