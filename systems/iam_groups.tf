module "iam_groups_infra" {
  source = "../modules/iam/groups"
  count = var.ENV == "pd" ? 1 : 0

  name = "${local.PROJECT}-${local.SYS}-infra-group"
}

module "iam_groups_policy_attachment" {
  source   = "../modules/iam/groups"
  for_each = var.ENV == "pd" ? local.group_policies : {}

  group_name  = module.iam_groups_infra[0].groupname
  policy_name = each.value.policy_name
  policy      = each.value.policy
}

locals {
  group_policies = {
    infra-policy = {
      policy_name = "${local.PROJECT}-${local.SYS}-infra-policy"
      policy      = "${file("iam_groups_policy/admin-policy.json")}"
    }
    # sourceip-allow = {
    #   policy_name = "${local.PROJECT}-${local.SYS}-sourceip-allow"
    #   policy      = "${file("iam_groups_policy/sourceip-allow-policy.json")}"
    # }
  }
}