variable "subnet_id" {
  description = "The Subnet ID of the subnet in which to place the gateway."
  type        = string
  default     = ""
}

variable "connectivity_type" {
  description = "Connectivity type for the gateway."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "vpc" {
  description = "Boolean if the EIP is in a VPC or not."
  type        = bool
  default     = true
}

variable "ngw_name" {
  description = "NatGateway Name"
  type        = string
  default     = ""
}