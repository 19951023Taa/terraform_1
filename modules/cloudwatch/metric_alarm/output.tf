output "tags" {
  value = aws_cloudwatch_metric_alarm.this.tags_all
}

output "arn" {
  value = aws_cloudwatch_metric_alarm.this.arn
}