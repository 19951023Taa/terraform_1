variable "name" {
  type    = string
  default = ""
}

variable "pattern" {
  type    = string
  default = ""
}

variable "log_group_name" {
  type    = string
  default = ""
}

variable "mt_name" {
  type    = string
  default = ""
}

variable "mt_namespace" {
  type    = string
  default = ""
}

variable "mt_value" {
  type    = string
  default = ""
}

variable "mt_default_value" {
  type    = string
  default = ""
}

variable "mt_dimensions" {
  type    = map
  default = {}
}