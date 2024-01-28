resource "aws_iam_user" "this" {
  name          = var.name
  force_destroy = var.force_destroy

  tags = merge(
    { "Name" = var.name },
    var.tags
  )
}

resource "aws_iam_user_group_membership" "this" {
  depends_on = [aws_iam_user.this]

  user   = var.name
  groups = var.groups
}

resource "aws_iam_user_login_profile" "this" {
  depends_on = [aws_iam_user.this]

  user                    = var.name
  pgp_key                 = var.pgp_key
  password_reset_required = var.password_reset_required
  password_length         = var.password_length
  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      password_reset_required,
    ]
  }
}