resource "aws_kms_key" "kms_key" {
  description         = "Serverless KMS Key"
  enable_key_rotation = true
}
