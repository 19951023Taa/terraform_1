variable "name" {
  type    = string
  default = ""
}

variable "delivery_policy" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}


variable "fifo_topic" {
  type    = bool
  default = false
}