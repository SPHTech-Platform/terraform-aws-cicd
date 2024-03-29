Terraform module that creates the Codepipeline with source(codestar connection) and build(codebuild) stages.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.24 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.24.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_codebuild"></a> [codebuild](#module\_codebuild) | SPHTech-Platform/codebuild/aws | ~> 1.1.1 |

## Resources

| Name | Type |
|------|------|
| [aws_codepipeline.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_iam_role.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy_document.codepipeline_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codepipeline_codebuild](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codepipeline_codestar](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codepipeline_inline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codepipeline_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifacts_bucket_name"></a> [artifacts\_bucket\_name](#input\_artifacts\_bucket\_name) | S3 Bucket for storing artifacts | `string` | n/a | yes |
| <a name="input_codebuild_additional_iam"></a> [codebuild\_additional\_iam](#input\_codebuild\_additional\_iam) | Additional IAM Policy Document for Codebuild | `list(any)` | `[]` | no |
| <a name="input_codebuild_buildspec_path"></a> [codebuild\_buildspec\_path](#input\_codebuild\_buildspec\_path) | buildspec.yml location in the artifact | `string` | `"buildspec.yml"` | no |
| <a name="input_codebuild_compute_type"></a> [codebuild\_compute\_type](#input\_codebuild\_compute\_type) | The Compute Type of the Codebuild Container | `string` | `"BUILD_GENERAL1_MEDIUM"` | no |
| <a name="input_codebuild_description"></a> [codebuild\_description](#input\_codebuild\_description) | Description of the Codebuild | `string` | `""` | no |
| <a name="input_codebuild_image"></a> [codebuild\_image](#input\_codebuild\_image) | Codebuild Image that will be use | `string` | `"aws/codebuild/standard:5.0"` | no |
| <a name="input_codebuild_name"></a> [codebuild\_name](#input\_codebuild\_name) | Name of the Codebuild | `string` | n/a | yes |
| <a name="input_codepipeline_additional_iam"></a> [codepipeline\_additional\_iam](#input\_codepipeline\_additional\_iam) | Additional IAM Policy Document needed by Codepipeline | `list(any)` | `[]` | no |
| <a name="input_codepipeline_additional_stage"></a> [codepipeline\_additional\_stage](#input\_codepipeline\_additional\_stage) | Additional IAM Policy Document for Codepipeline | `list(any)` | `[]` | no |
| <a name="input_codepipeline_name"></a> [codepipeline\_name](#input\_codepipeline\_name) | Codepipeline name | `string` | n/a | yes |
| <a name="input_codestar_arn"></a> [codestar\_arn](#input\_codestar\_arn) | Codestar ARN for connecting to Github | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Deployment environment | `string` | n/a | yes |
| <a name="input_repository_branch"></a> [repository\_branch](#input\_repository\_branch) | Repository branch to connect to | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | GitHub repository name | `string` | n/a | yes |
| <a name="input_repository_owner"></a> [repository\_owner](#input\_repository\_owner) | GitHub repository owner | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codebuild_output_artifact_name"></a> [codebuild\_output\_artifact\_name](#output\_codebuild\_output\_artifact\_name) | codebuild output artifact name that can be use for the next stage(if any) |
<!-- END_TF_DOCS -->
