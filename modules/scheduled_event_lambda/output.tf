output "rule_id" {
  value = aws_cloudwatch_event_rule.this.id
}

output "rule_arn" {
  value = aws_cloudwatch_event_rule.this.arn
}

output "rule_tags" {
  value = aws_cloudwatch_event_rule.this.tags_all
}