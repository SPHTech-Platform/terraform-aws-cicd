resource "aws_iam_role" "codepipeline_role" {
  name               = "${var.codepipeline_name}-role"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume_role.json

  inline_policy {
    name   = var.codepipeline_name
    policy = data.aws_iam_policy_document.codepipeline_inline_policy.json
  }
}

resource "aws_iam_role" "codebuild_role" {
  name               = "${var.codebuild_name}-role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume_role.json

  inline_policy {
    name   = var.codebuild_name
    policy = data.aws_iam_policy_document.codebuild_inline_policy.json
  }
}