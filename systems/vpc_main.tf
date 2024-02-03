module "vpc_main" {
  source = "../modules/vpc/vpc"

  cidr_block = var.vpc_cidr
  vpc_name   = "${local.PROJECT}-${local.SYS}-${var.ENV}-vpc-01"

  enable_dns_hostnames = true
  enable_dns_support   = true

  /* DHCP Option Set */
  enable_dhcp_options = true
  dhcp_opt_set_name   = "${local.PROJECT}-${local.SYS}-${var.ENV}-dhcp-optionset-01"

  /* Internet Gateway */
  create_igw = true
  igw_name   = "${local.PROJECT}-${local.SYS}-${var.ENV}-igw-01"
}