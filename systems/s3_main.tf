module "s3_terraform_main" {
  source = "../modules/s3"

  bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-terraform-bucket-01"
  policy = templatefile(
    "${path.module}/s3_bucket_policy/terraform_bucket_policy.json",
    {
      bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-terraform-bucket-01",
      account_id  = "${data.aws_caller_identity.this.account_id}"
    }
  )

  /* Lifecycle Option Set */
  s3_bucket_lifecycle_name  = "${local.PROJECT}-${local.SYS}-${var.ENV}-terraform-bucket-01-lifecycle"
  newer_noncurrent_versions = 3
  noncurrent_days           = 1
}

resource "aws_s3_bucket_versioning" "versioning_terraform_bucket" {
  bucket = module.s3_terraform_main.name
  versioning_configuration {
    status = "Enabled"
  }
}

module "s3_cloudtrail_main" {
  source = "../modules/s3"

  bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-cloudtrail-bucket-01"
  policy = templatefile(
    "${path.module}/s3_bucket_policy/cloudtrail_bucket_policy.json",
    {
      bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-cloudtrail-bucket-01",
      account_id  = "${data.aws_caller_identity.this.account_id}"
    }
  )

  /* Lifecycle Option Set */
  s3_bucket_lifecycle_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-cloudtrail-bucket-01-lifecycle"
  expiration_days          = 366
}

module "s3_config_main" {
  source = "../modules/s3"

  bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-config-bucket-01"
  policy = templatefile(
    "${path.module}/s3_bucket_policy/config_bucket_policy.json",
    {
      bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-config-bucket-01",
      account_id  = "${data.aws_caller_identity.this.account_id}"
    }
  )

  /* Lifecycle Option Set */
  s3_bucket_lifecycle_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-config-bucket-01-lifecycle"
  expiration_days          = 366
}



module "s3_flowlog_main" {
  source = "../modules/s3"

  bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-flowlog-bucket-01"
  policy = templatefile(
    "${path.module}/s3_bucket_policy/flowlog_bucket_policy.json",
    {
      bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-flowlog-bucket-01",
      account_id  = "${data.aws_caller_identity.this.account_id}"
    }
  )

  /* Lifecycle Option Set */
  s3_bucket_lifecycle_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-flowlog-bucket-01-lifecycle"
  expiration_days          = 366
}

module "s3_lambdalog_main" {
  source = "../modules/s3"

  bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-lambdalog-bucket-01"
  policy = templatefile(
    "${path.module}/s3_bucket_policy/lambdalog_bucket_policy.json",
    {
      bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-lambdalog-bucket-01",
      account_id  = "${data.aws_caller_identity.this.account_id}"
    }
  )

  /* Lifecycle Option Set */
  s3_bucket_lifecycle_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-lambdalog-bucket-01-lifecycle"
  expiration_days          = 366
}


module "s3_dblog_main" {
  source = "../modules/s3"

  bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-dblog-bucket-01"
  policy = templatefile(
    "${path.module}/s3_bucket_policy/dblog_bucket_policy.json",
    {
      bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-dblog-bucket-01",
      account_id  = "${data.aws_caller_identity.this.account_id}"
    }
  )

  /* Lifecycle Option Set */
  s3_bucket_lifecycle_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-dblog-bucket-01-lifecycle"
  expiration_days          = 366
}

module "s3_oslog_main" {
  source = "../modules/s3"

  bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-oslog-bucket-01"
  policy = templatefile(
    "${path.module}/s3_bucket_policy/oslog_bucket_policy.json",
    {
      bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-oslog-bucket-01",
      account_id  = "${data.aws_caller_identity.this.account_id}"
    }
  )

  /* Lifecycle Option Set */
  s3_bucket_lifecycle_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-oslog-bucket-01-lifecycle"
  expiration_days          = 366
}

module "s3_applicationlog_main" {
  source = "../modules/s3"

  bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-applicationlog-bucket-01"
  policy = templatefile(
    "${path.module}/s3_bucket_policy/applicationlog_bucket_policy.json",
    {
      bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-applicationlog-bucket-01",
      account_id  = "${data.aws_caller_identity.this.account_id}"
    }
  )

  /* Lifecycle Option Set */
  s3_bucket_lifecycle_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-applicationlog-bucket-01-lifecycle"
  expiration_days          = 366
}

module "s3_ssmlog_main" {
  source = "../modules/s3"

  bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-ssmlog-bucket-01"
  policy = templatefile(
    "${path.module}/s3_bucket_policy/ssmlog_bucket_policy.json",
    {
      bucket_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-ssmlog-bucket-01",
      account_id  = "${data.aws_caller_identity.this.account_id}"
    }
  )

  /* Lifecycle Option Set */
  s3_bucket_lifecycle_name = "${local.PROJECT}-${local.SYS}-${var.ENV}-ssmlog-bucket-01-lifecycle"
  expiration_days          = 366
}