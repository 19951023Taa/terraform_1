variable "name" {
  description = "name"
  type        = string
  default     = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}