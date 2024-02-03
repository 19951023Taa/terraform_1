terraform {
  required_version = "~> 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.35.0"
    }
  }
  backend "s3" {
  }
}

provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      "Env" = var.ENV
      "Sys" = local.SYS
    }
  }
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"

  default_tags {
    tags = {
      "Env" = var.ENV
      "Sys" = local.SYS
    }
  }
}

data "aws_caller_identity" "this" {}

data "aws_elb_service_account" "this" {}

data "aws_ec2_managed_prefix_list" "cloudfront" {
  name = "com.amazonaws.global.cloudfront.origin-facing"
}

data "aws_canonical_user_id" "this" {}

# data "aws_cloudfront_log_delivery_canonical_user_id" "this" {}

# data "aws_route53_zone" "api" {
#   zone_id = module.route53_main["api"].zone_id
# }

# data "aws_route53_zone" "web" {
#   zone_id = module.route53_main["web"].zone_id
# }


# data "aws_cloudfront_cache_policy" "cachingoptimized" {
#   name = "Managed-CachingOptimized"
# }

# data "aws_cloudfront_origin_request_policy" "allviewer" {
#   name = "Managed-AllViewer"
# }