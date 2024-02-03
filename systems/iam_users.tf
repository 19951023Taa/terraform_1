module "iam_users" {
  source   = "../modules/iam/users"
  for_each = var.ENV == "pd" ? local.users : {}

  name                    = each.value
  force_destroy           = true
  groups                  = [module.iam_groups_infra[0].groupname]
  pgp_key                 = local.pgp_key
  password_reset_required = true
  password_length         = 10
}

locals {
  users = {
    user_1 = "terraform-user_1"
    user_2 = "terraform-user_2"
    user_3 = "terraform-user_3"
    user_4 = "terraform-user_4"
    user_5 = "terraform-user_5"
  }
}

module "codecommit_user" {
  source = "../modules/iam/code_commit_user"
  count  = var.ENV == "pd" ? 1 : 0

  user_name               = "${local.PROJECT}-codecommit-power-user"
  parameter_user_name     = "UserName"
  parameter_password_name = "Password"
  type                    = "SecureString"
  repository_name         = "${local.PROJECT}-${local.SYS}-codecommit-repo"
  description             = "${local.PROJECT}-${local.SYS}-codecommit-repo"
}