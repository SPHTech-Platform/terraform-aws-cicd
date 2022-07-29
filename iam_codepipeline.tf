data "aws_iam_policy_document" "codepipeline_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "codepipeline_codestar" {
  statement {
    resources = [var.codestar_arn]
    actions   = ["codestar-connections:UseConnection"]
  }
}

data "aws_iam_policy_document" "codepipeline_codebuild" {
  statement {
    resources = [aws_codebuild_project.this.arn]

    actions = [
      "codebuild:StartBuild",
      "codebuild:BatchGetBuilds",
    ]
  }
}

data "aws_iam_policy_document" "codepipeline_kms" {
  statement {
    resources = [aws_kms_key.kms_key.arn]

    actions = [
      "kms:DescribeKey",
      "kms:GenerateDataKey",
      "kms:Encrypt",
      "kms:ReEncryptFrom",
      "kms:ReEncryptTo",
      "kms:Decrypt",
    ]
  }
}

data "aws_iam_policy_document" "codepipeline_s3" {
  statement {
    resources = [
      "arn:aws:s3:::${var.artifacts_bucket_name}/*",
    ]

    actions = [
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject",
      "s3:PutObjectAcl",
    ]
  }
}

data "aws_iam_policy_document" "codepipeline_inline_policy" {
  source_policy_documents = concat([
    data.aws_iam_policy_document.codepipeline_codestar.json,
    data.aws_iam_policy_document.codepipeline_codebuild.json,
    data.aws_iam_policy_document.codepipeline_kms.json,
    data.aws_iam_policy_document.codepipeline_s3.json,
  ], var.codepipeline_additional_iam)
}
