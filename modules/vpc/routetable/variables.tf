variable "vpc_id" {}
variable "routes" {}

variable "route_table_tags" {
  description = "route table tags"
  type        = map(any)
  default     = {}
}

variable "table_name" {
  description = "route table tags"
  type        = string
  default     = ""
}