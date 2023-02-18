# Module Title

<!--
This repo is a template for creating Terraform modules. It has best practices module structure and has
linting of terraform HCL via Github actions pre configured.

https://www.terraform.io/docs/modules/index.html
https://www.terraform.io/docs/cloud/registry/using.html

-->

Add a meaningful description here

## Tagging

Describe what tags this module supports / requires. Try to have good tagging hygiene for cost allocation.

This resource supports tagging. You should pass:

- `workload` (we default to ml)

## Usage

Include a usage example here. i.e how to use the module or submodules with the minimal configuration

```hcl
module "conor-test" {
  source  = "app.terraform.io/acme/s3/aws"
  version = "0.0.1"
  name    = "conor-test"

  read_buckets = [
    "acme-sandbox-foo",
    "acme-sandbox-bar",
  ]
}
```

## Sub Modules

List and describe the sub modules available in this module if they might be used in isolation. Sub modules are just
directories in the `modules` directory.
