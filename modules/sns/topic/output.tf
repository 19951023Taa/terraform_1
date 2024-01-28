output "topic_id" {
  value = aws_sns_topic.this.id
}

output "topic_arn" {
  value = aws_sns_topic.this.arn
}

output "topic_tags_all" {
  value = aws_sns_topic.this.tags_all
}
