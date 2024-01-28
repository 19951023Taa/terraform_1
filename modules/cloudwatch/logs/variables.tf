variable "name" {
  type    = string
  default = ""
}

variable "retention_in_days" {
  type    = string
  default = "30"
}

variable "tags" {
  type    = map(any)
  default = {}
}