/* Common */
variable "ENV" {
  description = "Environment Code ex)PD/ST/DV/DR"
  type        = string
  default     = ""
}
variable "region" {}

/* VPC */
variable "vpc_cidr" {}
variable "subnet_cidrs" {}

/* EC2 */
variable "key_name" {}
variable "private_ip" {}

# /* Route53 */
# variable "domain_name_api" {}
# variable "domain_name_web" {}
