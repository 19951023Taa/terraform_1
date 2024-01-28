variable "name" {
  type    = string
  default = ""
}

variable "description" {
  type    = string
  default = ""
}

variable "policy" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}