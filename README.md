# AWS IAM OIDC Provider Module

This module creates a single AWS IAM OpenID Connect (OIDC) provider that can be used for workload identity federation, such as GitHub Actions authenticating to AWS.

## What This Module Creates

- 1 IAM OIDC provider

## Usage

```hcl
module "github_oidc_provider" {
  source = "git::ssh://git@github.com/<org>/terraform-oidc-provider-module.git?ref=v0.1.0"

  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    "<thumbprint>"
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `url` | OIDC provider URL, for example `https://token.actions.githubusercontent.com` | `string` | n/a | yes |
| `client_id_list` | List of client IDs (audiences) allowed for this OIDC provider | `list(string)` | n/a | yes |
| `thumbprint_list` | List of server certificate thumbprints for the OIDC provider | `list(string)` | n/a | yes |
| `tags` | Tags to apply where supported | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `arn` | ARN of the IAM OIDC provider |
| `url` | URL of the IAM OIDC provider |

## Prerequisites

- Terraform 1.x
- AWS provider configured in the root module
- IAM permissions to create IAM OIDC providers
