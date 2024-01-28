output "vault_name" {
  value = aws_backup_vault.this.id
}

output "vault_arn" {
  value = aws_backup_vault.this.arn
}