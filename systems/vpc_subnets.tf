module "vpc_subnets" {
  source   = "../modules/vpc/subnet"
  for_each = var.subnet_cidrs

  name   = "${local.PROJECT}-${local.SYS}-${var.ENV}-${replace(each.key, "_", "-")}"
  vpc_id = module.vpc_main.vpc_id

  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az
}