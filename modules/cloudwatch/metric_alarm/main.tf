resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = var.alarm_name
  alarm_description   = var.alarm_description
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = try(var.statistic, null)
  extended_statistic  = try(var.extended_statistic, null)
  actions_enabled     = var.actions_enabled
  alarm_actions       = var.alarm_actions
  datapoints_to_alarm = var.datapoints_to_alarm
  treat_missing_data  = var.treat_missing_data
  dimensions          = var.dimensions
  threshold           = var.threshold

  tags = merge(
    { "Name" = var.alarm_name },
    var.tags
  )
}