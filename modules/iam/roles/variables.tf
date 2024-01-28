variable "name" {
  type    = string
  default = ""
}

variable "role_description" {
  type    = string
  default = ""
}

variable "force_detach_policies" {
  type    = bool
  default = true
}

variable "managed_policy_arns" {
  type    = list(any)
  default = []
}

variable "assume_role_policy" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}