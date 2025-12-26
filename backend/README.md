## TF Backend configuration

Use this code to create S3 bucket for the remote state and locking from the main module.

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

Use output value from `backend_bucket` as a backend bucket for the main module.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> v1.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_versioning.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | Region where AWS resources will be created | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_bucket"></a> [backend\_bucket](#output\_backend\_bucket) | n/a |
<!-- END_TF_DOCS -->