resource "aws_iam_role" "codepipeline" {
  name               = "${var.codepipeline_name}-role"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume_role.json

  inline_policy {
    name   = var.codepipeline_name
    policy = data.aws_iam_policy_document.codepipeline_inline_policy.json
  }
}
