module "iam_roles" {
  source   = "../modules/iam/roles"
  for_each = local.roles

  name                  = each.value.name
  role_description      = each.value.role_description
  force_detach_policies = true
  managed_policy_arns   = [module.iam_policies["${each.value.policy}"].arn]
  assume_role_policy    = file("iam_assume_roles_policy/${each.value.resource}_assume_role_policy.json")
}

module "iam_roles_managed" {
  source   = "../modules/iam/roles"
  for_each = local.managed_roles

  name                  = each.value.name
  role_description      = each.value.role_description
  force_detach_policies = true
  managed_policy_arns   = each.value.managed_policy_arns
  assume_role_policy    = each.value.assume_role_policy
}

locals {
  roles = {
    ec2_app_role = {
      name             = "${local.PROJECT}-${local.SYS}-${var.ENV}-ec2-app-role"
      role_description = "Attach to EC2 brdg role"
      policy           = "ec2_app_instance_policy"
      resource         = "ec2"
    },
    ec2_jump_role = {
      name             = "${local.PROJECT}-${local.SYS}-${var.ENV}-ec2-jump-role"
      role_description = "Attach to EC2 jump role"
      policy           = "ec2_jump_instance_policy"
      resource         = "ec2"
    },
    lambda_startstop_role = {
      name             = "${local.PROJECT}-${local.SYS}-${var.ENV}-lambda-startstop-role"
      role_description = "Attach to Lambda startstop role"
      policy           = "lambda_startstop_instance_policy"
      resource         = "lambda"
    },
    cloudtrail_role = {
      name             = "${local.PROJECT}-${local.SYS}-${var.ENV}-cloudtrail-role"
      role_description = "Allow CloudTrail to send logs to CloudWatch Logs"
      policy           = "cloudtrail_policy"
      resource         = "cloudtrail"
    },
    flowlog_role = {
      name             = "${local.PROJECT}-${local.SYS}-${var.ENV}-flowlog-role"
      role_description = "Allow FlowLog to send logs to CloudWatch Logs"
      policy           = "flowlog_policy"
      resource         = "flowlog"
    }
  }
  
  managed_roles = {
    Administrator_role = {
      name                = "Administrator"
      role_description    = "Allow full access to AWS services and resources"
      managed_policy_arns = ["${local.managed_policy_arns.AdministratorAccess}"]
      assume_role_policy = templatefile(
        "${path.module}/iam_assume_roles_policy/iam_assume_role_policy.json",
        {
          account_id = "${data.aws_caller_identity.this.account_id}"
        }
      )
    },
    config_role = {
      name             = "${local.PROJECT}-${local.SYS}-${var.ENV}-config-role"
      role_description = "for AWS Config"
      managed_policy_arns = [
        "${local.managed_policy_arns.AWS_ConfigRole}"
      ]
      assume_role_policy = "${file("iam_assume_roles_policy/config_assume_role_policy.json")}"
    },
    lambda_transfer_role = {
      name             = "${local.PROJECT}-${local.SYS}-${var.ENV}-lambda-transfer-role"
      role_description = "Allow Lambda to send from CloudWatch Logs to S3 bucket"
      managed_policy_arns = [
        "${local.managed_policy_arns.AmazonS3FullAccess}",
        "${local.managed_policy_arns.CloudWatchFullAccessV2}",
        "${local.managed_policy_arns.CloudWatchLogsFullAccess}",
        "${local.managed_policy_arns.AWSLambdaBasicExecutionRole}"
      ]
      assume_role_policy = "${file("iam_assume_roles_policy/lambda_assume_role_policy.json")}"
    },
    backup_role = {
      name             = "${local.PROJECT}-${local.SYS}-${var.ENV}-backup-role"
      role_description = "for AWS Backup"
      managed_policy_arns = [
        "${local.managed_policy_arns.AWSBackupServiceRolePolicyForBackup}",
        "${local.managed_policy_arns.AWSBackupServiceRolePolicyForRestores}",
        module.iam_policies["backup_policy"].arn
      ]
      assume_role_policy = "${file("iam_assume_roles_policy/backup_assume_role_policy.json")}"
    },
    rds_monitoring_role = {
      name             = "${local.PROJECT}-${local.SYS}-${var.ENV}-rds-monitoring-role"
      role_description = "for AWS RDS monitoring"
      managed_policy_arns = [
        "${local.managed_policy_arns.AmazonRDSEnhancedMonitoringRole}",
      ]
      assume_role_policy = "${file("iam_assume_roles_policy/rds_monitoring_assume_role_policy.json")}"
    }
  }
}