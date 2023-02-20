# S3 Module

An opinionated S3 module that can be used for an organization to create predictable bucket names.

## Naming scheme

Because the S3 namespace is global and not per account or region. We must ensure globally unique bucket names while also
ensuring they are predictable. For this reason this module takes the `name` supplied and prepends the region and IAM alias
of the account. i.e a bucket with the name `my-bucket` would be named `conzy-demo-production-eu-west-1-my-bucket` if created
in the `eu-west-1` region. This module requires that you have an IAM Account Alias configured. The demo project sets this as
part of its core infra for convenience.

This means application code when interacting with buckets can always prepend the alias and region and the code will be
totally portable between regions and environments.

## Usage

```hcl
module "test" {
  source  = "app.terraform.io/acme/s3/aws"
  version = "0.0.1"
  name    = "my-bucket"
}
```
