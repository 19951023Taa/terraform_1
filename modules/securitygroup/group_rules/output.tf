output "group_id" {
  description = "group id"
  value       = aws_security_group.this.id
}

output "rules_id" {
  description = "rule id"
  value       = [for value in aws_security_group_rule.this : value.id]
}