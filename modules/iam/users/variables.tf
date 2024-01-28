variable "name" {
  type    = string
  default = ""
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "groups" {
  type    = list(any)
  default = []
}

variable "pgp_key" {
  type    = string
  default = ""
}

variable "password_reset_required" {
  type    = bool
  default = true
}

variable "password_length" {
  type    = string
  default = ""
}