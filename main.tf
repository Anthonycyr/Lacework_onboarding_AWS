terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
      version = "~> 1.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}

provider "lacework" {}

module "aws_config" {
  source  = "lacework/config/aws"
  version = "~> 0.5"
  iam_role_name = "LaceworkRole"
}

module "aws_cloudtrail" {
  source  = "lacework/cloudtrail/aws"
  version = "~> 2.0"

  bucket_force_destroy  = true
  use_existing_iam_role = true
  iam_role_name         = module.aws_config.iam_role_name
  iam_role_arn          = module.aws_config.iam_role_arn
  iam_role_external_id  = module.aws_config.external_id
}
resource "aws_s3_bucket_public_access_block" "cloudtrail-s3" {
  bucket = module.aws_cloudtrail.bucket_name

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
