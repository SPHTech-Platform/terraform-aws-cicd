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

variable "codebuild_description" {
  description = "Description of the Codebuild"
  type        = string
  default     = ""
}

variable "codestar_arn" {
  description = "Codestar ARN for connecting to Github"
  type        = string
}

variable "codebuild_compute_type" {
  description = "The Compute Type of the Codebuild Container"
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

variable "codebuild_buildspec_path" {
  description = "buildspec.yml location in the artifact"
  type        = string
  default     = "buildspec.yml"
}

variable "codebuild_image" {
  description = "Codebuild Image that will be use"
  type        = string
  default     = "aws/codebuild/standard:5.0"
}

variable "codepipeline_additional_iam" {
  description = "Additional IAM Policy Document needed by Codepipeline"
  type        = list(any)
  default     = []
}

variable "codebuild_additional_iam" {
  description = "Additional IAM Policy Document for Codebuild"
  type        = list(any)
  default     = []
}

variable "codepipeline_additional_stage" {
  description = "Additional IAM Policy Document for Codepipeline"
  type        = list(any)
  default     = []
}
