resource "aws_cloudwatch_log_metric_filter" "this" {
  name = var.name

  pattern        = var.pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name          = var.mt_name
    namespace     = var.mt_namespace
    value         = var.mt_value
    default_value = var.mt_default_value
    dimensions    = var.mt_dimensions
  }
}