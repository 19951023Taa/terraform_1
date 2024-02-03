module "rtb_public" {
  source = "../modules/vpc/routetable"

  vpc_id     = module.vpc_main.vpc_id
  table_name = local.public_01.name
  routes     = local.public_01.routes
}

module "rtb_private" {
  source = "../modules/vpc/routetable"

  vpc_id     = module.vpc_main.vpc_id
  table_name = local.private_01.name
  routes     = local.private_01.routes
}

resource "aws_route_table_association" "this" {
  for_each       = var.subnet_cidrs
  subnet_id      = module.vpc_subnets["${each.key}"].subnet_id
  route_table_id = substr("${each.key}", 0, 6) == "public" ? module.rtb_public.table_id : module.rtb_private.table_id
}

locals {
  public_01 = {
    name = "${local.PROJECT}-${local.SYS}-${var.ENV}-public-route-01"
    routes = {
      rt01 = {
        destination_cidr_block = "0.0.0.0/0"
        gateway_id             = module.vpc_main.igw_id
      }
    }
  }

  private_01 = {
    name   = "${local.PROJECT}-${local.SYS}-${var.ENV}-private-route-01"
    routes = {}
  }
}