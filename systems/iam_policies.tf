module "iam_policies" {
  source   = "../modules/iam/policies"
  for_each = local.policies

  name        = each.value.name
  description = each.value.description
  policy = templatefile(
    "${path.module}/iam_policies/${each.key}.json",
    {
      account_id = "${data.aws_caller_identity.this.account_id}"
    }
  )
}

locals {
  policies = {
    cloudtrail_policy = {
      name        = "${local.PROJECT}-${local.SYS}-${var.ENV}-cloudtrail-policy-for-cloudwatchLogs"
      description = "CloudTrail policy to send logs to CloudWatch Logs"
    },
    flowlog_policy = {
      name        = "${local.PROJECT}-${local.SYS}-${var.ENV}-flowlog-policy-for-cloudwatchLogs"
      description = "FlowLog policy to send logs to CloudWatch Logs"
    },
    ec2_jump_instance_policy = {
      name        = "${local.PROJECT}-${local.SYS}-${var.ENV}-ec2-jump-policy"
      description = "EC2-jump-policy"
    },
    ec2_app_instance_policy = {
      name        = "${local.PROJECT}-${local.SYS}-${var.ENV}-ec2-app-policy"
      description = "EC2-app-policy"
    },
    lambda_startstop_instance_policy = {
      name        = "${local.PROJECT}-${local.SYS}-${var.ENV}-lambda-startstop-policy"
      description = "Lambda-startstop-instance-policy"
    },
    backup_policy = {
      name        = "${local.PROJECT}-${local.SYS}-${var.ENV}-backup-policy"
      description = "Backup policy attach to Iam role for EC2"
    }
  }
}