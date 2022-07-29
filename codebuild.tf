resource "aws_codebuild_project" "codebuild" {
  name           = var.codebuild_name
  service_role   = aws_iam_role.codebuild_role.arn
  encryption_key = aws_kms_key.kms_key.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_MEDIUM"
    image                       = var.codebuild_image
    image_pull_credentials_type = "CODEBUILD"
    type                        = "LINUX_CONTAINER"

    environment_variable {
      name  = "ENV"
      value = var.env
    }
  }

  source {
    buildspec = "buildspec.yml"
    type      = "CODEPIPELINE"
  }
}
