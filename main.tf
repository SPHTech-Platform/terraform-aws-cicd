resource "aws_codepipeline" "this" {
  name     = var.codepipeline_name
  role_arn = aws_iam_role.codepipeline.arn

  artifact_store {
    location = var.artifacts_bucket_name
    type     = "S3"

    encryption_key {
      id   = aws_kms_key.kms_key.arn
      type = "KMS"
    }
  }

  stage {
    name = "Source"

    action {
      category         = "Source"
      name             = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_artifact"]

      configuration = {
        BranchName       = var.repository_branch
        FullRepositoryId = "${var.repository_owner}/${var.repository_name}"
        ConnectionArn    = var.codestar_arn
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_artifact"]
      output_artifacts = [local.codebuild_output_artifact_name]

      configuration = {
        "ProjectName" = var.codebuild_name
      }
    }
  }

  dynamic "stage" {
    for_each = var.codepipeline_additional_stage
    content {
      name = stage.value["name"]

      dynamic "action" {
        for_each = stage.value.action
        content {
          name             = action.value.name
          category         = action.value.category
          owner            = action.value.owner
          provider         = action.value.provider
          version          = action.value.version
          input_artifacts  = lookup(action.value, "input_artifacts", null)
          output_artifacts = lookup(action.value, "output_artifacts", null)
          configuration    = lookup(action.value, "configuration", null)
          role_arn         = lookup(action.value, "role_arn", null)
          run_order        = lookup(action.value, "run_order", null)
          region           = lookup(action.value, "region", null)
          namespace        = lookup(action.value, "namespace", null)
        }
      }
    }
  }
}
