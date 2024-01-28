variable "zone_name" {
  type    = string
  default = ""
}

variable "record_name" {
  type    = string
  default = ""
}

variable "type" {
  type    = string
  default = ""
}

variable "alias_name" {
  type    = string
  default = ""
}

variable "alias_zone_id" {
  type    = string
  default = ""
}

variable "evaluate_target_health" {
  type    = bool
  default = false
}