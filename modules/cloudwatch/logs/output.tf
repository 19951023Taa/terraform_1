output "tags" {
  value = aws_cloudwatch_log_group.this.tags_all
}

output "name" {
  value = aws_cloudwatch_log_group.this.name
}

output "arn" {
  value = aws_cloudwatch_log_group.this.arn
}