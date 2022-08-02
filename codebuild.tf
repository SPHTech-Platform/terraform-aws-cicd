module "codebuild" {
  source = "github.com/SPHTech-Platform/terraform-aws-codebuild"

  name                  = var.codebuild_name
  description           = var.codebuild_description
  build_image           = "aws/codebuild/standard:5.0"
  buildspec             = "./buildspec.yml"
  artifacts_bucket_name = var.artifacts_bucket_name
  encryption_key_arn    = var.encryption_key_arn

  artifacts = {
    type = "CODEPIPELINE"
  }

  environment_variables = [
    {
      name  = "ENV"
      value = var.env
    }
  ]
}
