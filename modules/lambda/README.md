<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | 2.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.57.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.5.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.57.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lambda_function.checksum_calculator](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_s3_bucket_notification.bucket_notification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [archive_file.checksum_calculator](https://registry.terraform.io/providers/hashicorp/archive/2.5.0/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_arn"></a> [bucket\_arn](#input\_bucket\_arn) | The ARN of the S3 bucket where objects will be uploaded | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket where objects will be uploaded | `string` | n/a | yes |
| <a name="input_lambda_role_arn"></a> [lambda\_role\_arn](#input\_lambda\_role\_arn) | The ARN of the IAM role for the Lambda function | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of the Lambda function |
<!-- END_TF_DOCS -->