resource "aws_cloudwatch_event_rule" "this" {
  name        = var.name
  description = var.description

  role_arn   = var.role_arn
  state = var.state

  tags = merge(
    { "Name" = var.name },
    var.tags
  )

  /* Scheduled event */
  schedule_expression = try(var.schedule_expression, null)

  /* Event pattern */
  event_pattern = try(var.event_pattern, null)
}

resource "aws_cloudwatch_event_target" "this" {
  rule      = aws_cloudwatch_event_rule.this.name
  target_id = var.target_id
  arn       = var.target_arn
  input     = try(var.input, null)
}

resource "aws_lambda_permission" "this" {
  statement_id  = var.statement_id
  action        = var.action
  function_name = var.lambda_function_name
  principal     = var.principal
  source_arn    = aws_cloudwatch_event_rule.this.arn
}