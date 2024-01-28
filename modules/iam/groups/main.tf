resource "aws_iam_group" "this" {
  count = length(var.name) > 0 ? 1 : 0
  name  = var.name
}

resource "aws_iam_group_policy" "this" {
  count = length(var.policy_name) > 0 ? 1 : 0

  name   = var.policy_name
  group  = var.group_name
  policy = var.policy
}

resource "aws_iam_group_policy_attachment" "this" {
  count = length(var.policy_arn) > 0 ? 1 : 0

  group      = var.group_name
  policy_arn = var.policy_arn
}