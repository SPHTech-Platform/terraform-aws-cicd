variable "env" {
  description = "Deployment environment"
  type        = string
}

variable "repository_branch" {
  description = "Repository branch to connect to"
  type        = string
}

variable "repository_owner" {
  description = "GitHub repository owner"
  type        = string
  default     = "SPHTech"
}

variable "repository_name" {
  description = "GitHub repository name"
  type        = string
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  type        = string
}

variable "deployment_bucket_name" {
  description = "Deployment Bucket used by serverless"
  type        = string
}

variable "codepipeline_name" {
  description = "Codepipeline name"
  type        = string
}

variable "codebuild_name" {
  description = "Name of the Codebuild"
  type        = string
}


variable "codestar_arn" {
  description = "Codestar ARN for connecting to Github"
  type        = string
}

variable "codebuild_image" {
    description = "Codebuild Image that will be use"
    type = string
    default = "aws/codebuild/standard:5.0"
}

variable "codepipeline_additional_iam" {
    description = "Additional IAM Policy Document needed by Codepipeline"
    type = list(any)
    default = []
}

variable "codebuild_additional_iam" {
    description = "Additional IAM Policy document by Codebuild"
    type = list(any)
    default = []
}

variable "codepipeline_additional_stage" {
    description = ""
    type = list(any)
    default = []
}