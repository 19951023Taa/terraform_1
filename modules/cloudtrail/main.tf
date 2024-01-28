resource "aws_cloudtrail" "this" {
  name                          = var.name
  s3_bucket_name                = var.s3_bucket_name
  include_global_service_events = var.include_global_service_events
  enable_logging                = var.enable_logging
  enable_log_file_validation    = var.enable_log_file_validation
  is_multi_region_trail         = var.is_multi_region_trail
  cloud_watch_logs_role_arn     = var.cloud_watch_logs_role_arn
  cloud_watch_logs_group_arn    = var.cloud_watch_logs_group_arn
  tags = merge(
    { "Name" = var.name },
    var.tags,
  )
}