# module "iam_account_password_policy" {
#   source = "../modules/iam/account_password_policy"
#   count  = var.ENV == "pd" ? 1 : 0

#   minimum_password_length        = 10
#   require_lowercase_characters   = true
#   require_numbers                = true
#   require_uppercase_characters   = true
#   require_symbols                = true
#   max_password_age               = 0
#   allow_users_to_change_password = true
#   password_reuse_prevention      = 0
# }