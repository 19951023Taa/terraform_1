resource "aws_sns_topic" "this" {
  name = var.name

  delivery_policy = var.delivery_policy
  fifo_topic      = var.fifo_topic

  tags = merge(
    { "Name" = var.name },
    var.tags
  )
}