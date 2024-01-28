resource "aws_backup_vault" "this" {
  name = var.name
  tags = merge(
    { "Name" = var.name },
    var.tags
  )
}