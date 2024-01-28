resource "aws_backup_plan" "this" {
  name = var.backup_plan_name

  rule {
    rule_name         = var.rule_name
    target_vault_name = var.target_vault_name
    schedule          = var.schedule
    start_window      = var.start_window
    completion_window = var.completion_window

    lifecycle {
      delete_after = var.delete_after
    }
  }
}

resource "aws_backup_selection" "this" {
  iam_role_arn = var.iam_role_arn
  name         = var.selection_name
  plan_id      = aws_backup_plan.this.id

  resources = var.resources_name
}