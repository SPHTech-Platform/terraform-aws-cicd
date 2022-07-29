resource "aws_codebuild_project" "this" {
  name           = var.codebuild_name
  service_role   = aws_iam_role.codebuild.arn
  encryption_key = aws_kms_key.kms_key.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = var.codebuild_compute_type
    image                       = var.codebuild_image
    image_pull_credentials_type = "CODEBUILD"
    type                        = "LINUX_CONTAINER"

    environment_variable {
      name  = "ENV"
      value = var.env
    }
  }

  source {
    buildspec = var.codebuild_buildspec_path
    type      = "CODEPIPELINE"
  }
}
