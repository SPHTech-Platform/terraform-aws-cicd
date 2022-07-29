data "aws_iam_policy_document" "codebuild_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "codebuild_s3" {
  statement {
    resources = [
      "arn:aws:s3:::${var.artifacts_bucket_name}/*",
      "arn:aws:s3:::${var.deployment_bucket_name}/*",
    ]

    actions = [
      "s3:PutObjectAcl",
      "s3:PutObject",
      "s3:ListBucket",
      "s3:GetObject",
      "s3:DeleteObject",
    ]
  }

  statement {
    resources = ["arn:aws:s3:::${var.deployment_bucket_name}"]

    actions = [
      "s3:CreateBucket",
      "s3:GetBucketLogging",
      "s3:GetBucketLocation",
      "s3:ListBucket",
    ]
  }
}

data "aws_iam_policy_document" "codebuild_kms" {
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

data "aws_iam_policy_document" "codebuild_vpc" {
  statement {
    resources = ["*"]

    actions = [
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeVpcs",
    ]
  }
}

data "aws_iam_policy_document" "codebuild_logstream" {

  statement {
    resources = ["arn:aws:logs:*:*:log-group:/aws/codebuild/${var.codebuild_name}:log-stream:*"]

    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
      "logs:DeleteLogGroup",
      "logs:PutRetentionPolicy",
    ]
  }

  statement {
    resources = ["arn:aws:logs:*:*:log-group:*:log-stream:*"]
    actions   = ["logs:DescribeLogGroups"]
  }
}

# permission for lambda role
data "aws_iam_policy_document" "codebuild_iam" {
  statement {
    resources = ["arn:aws:iam::*:role/*"]

    actions = [
      "iam:GetRole",
      "iam:CreateRole",
      "iam:GetRolePolicy",
      "iam:PutRolePolicy",
      "iam:AttachRolePolicy",
      "iam:PassRole",
    ]
  }
}

data "aws_iam_policy_document" "codebuild_inline_policy" {

  source_policy_documents = concat([
    data.aws_iam_policy_document.codebuild_s3.json,
    data.aws_iam_policy_document.codebuild_kms.json,
    data.aws_iam_policy_document.codebuild_vpc.json,
    data.aws_iam_policy_document.codebuild_logstream.json,
    data.aws_iam_policy_document.codebuild_iam.json
  ], var.codebuild_additional_iam)
}
