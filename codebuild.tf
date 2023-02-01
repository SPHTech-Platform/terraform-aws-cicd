module "codebuild" {
  source  = "SPHTech-Platform/codebuild/aws"
  version = "~> 1.1.1"

  name                  = var.codebuild_name
  description           = var.codebuild_description
  build_image           = "aws/codebuild/standard:5.0"
  buildspec             = "./buildspec.yml"
  artifacts_bucket_name = var.artifacts_bucket_name
  additional_iam        = var.codebuild_additional_iam
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
