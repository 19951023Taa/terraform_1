resource "aws_security_group" "this" {
  name                   = var.group_name
  vpc_id                 = var.vpc_id
  description            = var.group_description
  revoke_rules_on_delete = var.revoke_rules_on_delete

  tags = merge(
    { "Name" = var.group_name },
    var.tags,
  )
}

resource "aws_security_group_rule" "this" {
  for_each          = var.rules
  security_group_id = aws_security_group.this.id
  description       = each.key
  type              = each.value.type

  /* Require */
  from_port = try(each.value.from_port, 0)
  to_port   = try(each.value.to_port, 0)
  protocol  = try(each.value.protocol, "-1")
  /* Optional */
  self                     = try(each.value.self, null)
  cidr_blocks              = try(each.value.cidr_blocks, null)
  ipv6_cidr_blocks         = try(each.value.ipv6_cidr_blocks, null)
  prefix_list_ids          = try(each.value.prefix_list_ids, null)
  source_security_group_id = try(each.value.source_security_group_id, null)
}

resource "aws_security_group_rule" "egress_default" {
  security_group_id = aws_security_group.this.id
  description       = "egress default"
  type              = "egress"

  /* Require */
  from_port = "0"
  to_port   = "0"
  protocol  = "-1"
  /* Optional */
  cidr_blocks = ["0.0.0.0/0"]
}