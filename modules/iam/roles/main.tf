resource "aws_iam_role" "this" {
  name                  = var.name
  description           = var.role_description
  force_detach_policies = var.force_detach_policies
  managed_policy_arns   = var.managed_policy_arns
  assume_role_policy    = var.assume_role_policy

  tags = merge(
    { "Name" = var.name },
    var.tags
  )
}
