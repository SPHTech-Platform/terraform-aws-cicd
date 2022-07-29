output "codebuild_output_artifact_name" {
  description = "codebuild output artifact name that can be use for the next stage(if any)"
  value = local.codebuild_output_artifact_name
}