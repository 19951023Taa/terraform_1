variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = ""
}

variable "ingress_rules" {
  description = "Ingress rules"
  type        = map(any)
  default     = {}
}

variable "egress_rules" {
  description = "Egress rules"
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "Egress rules"
  type        = map(any)
  default     = {}
}

variable "group_name" {
  description = "Security group name"
  type        = string
  default     = ""
}

variable "group_description" {
  description = "Security group description"
  type        = string
  default     = ""
}

variable "revoke_rules_on_delete" {
  description = ""
  type        = bool
  default     = false
}

variable "rules" {
  description = ""
  type        = map(any)
  default     = {}
}