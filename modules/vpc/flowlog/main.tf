resource "aws_flow_log" "this" {
  iam_role_arn             = var.iam_role_arn
  log_destination          = var.log_destination
  log_destination_type     = var.log_destination_type
  traffic_type             = var.traffic_type
  vpc_id                   = var.vpc_id
  max_aggregation_interval = var.max_aggregation_interval

  tags = merge(
    { "Name" = var.name },
    var.tags,
  )
}