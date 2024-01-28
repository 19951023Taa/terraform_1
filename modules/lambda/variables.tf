variable "source_file" {
  type    = string
  default = null
}

variable "source_dir" {
  type    = string
  default = null
}

variable "output_path" {
  type    = string
  default = ""
}

variable "lambda_function_name" {
  type    = string
  default = ""
}

variable "role" {
  type    = string
  default = ""
}

variable "handler" {
  type    = string
  default = "lambda_function.lambda_handler"
}

variable "runtime" {
  type    = string
  default = "python3.9"
}

variable "variables" {
  type    = map(any)
  default = {}
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "timeout" {
    type    = string
    default = "3"
}