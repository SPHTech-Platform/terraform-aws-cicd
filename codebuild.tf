module "codebuild" {
  source = "github.com/hashicorp/SPHTech-Platform/terraform-aws-codebuild"

  name                  = "var.codebuild_name"
  description           = "codebuild for test project"
  build_image           = "aws/codebuild/standard:5.0"
  buildspec             = "./buildspec.yml"
  artifacts_bucket_name = local.artifacts_bucket_name

  artifacts = {
    type = "CODEPIPELINE"
  }

  environment_variables = [
    {
      name  = "ENV"
      value = "sandbox"
    }
  ]
}
