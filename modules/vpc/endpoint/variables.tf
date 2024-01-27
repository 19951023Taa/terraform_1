variable "vpc_id" {
  description = "The ID of the VPC in which the endpoint will be used."
  type        = string
  default     = ""
}

variable "service_name" {
  description = "The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service>."
  type        = string
  default     = ""
}

variable "vpc_endpoint_type" {
  description = "The VPC endpoint type, Gateway, GatewayLoadBalancer, or Interface."
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "The ID of one or more security groups to associate with the network interface. ."
  type        = list(any)
  default     = []
}

variable "private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC. Applicable for endpoints of type Interface."
  type        = bool
  default     = false
}

variable "name" {
  type    = string
  default = ""
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "subnet_ids" {
  description = "The ID of the subnet to be associated with the VPC endpoint."
  type        = list(any)
  default     = []
}