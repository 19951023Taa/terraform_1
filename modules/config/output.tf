output "channel_name" {
  value = aws_config_delivery_channel.this.id
}

output "recorder_name" {
  value = aws_config_configuration_recorder.this.id
}