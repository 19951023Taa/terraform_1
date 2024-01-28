resource "aws_config_delivery_channel" "this" {
  name           = "${var.name}-delivery-channel"
  s3_bucket_name = var.s3_bucket_name
}

resource "aws_config_configuration_recorder" "this" {
  name     = "${var.name}-recorder"
  role_arn = var.role_arn

  recording_group {
    all_supported                 = var.all_supported
    include_global_resource_types = var.include_global_resource_types
  }
}

resource "aws_config_configuration_recorder_status" "this" {
  name       = aws_config_configuration_recorder.this.id
  is_enabled = var.is_enabled
  depends_on = [aws_config_delivery_channel.this]
}