variable "user_name" {
  type    = string
  default = ""
}

variable "path" {
  type    = string
  default = "/"
}

variable "service_name" {
  type    = string
  default = "codecommit.amazonaws.com"
}

variable "policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AWSCodeCommitPowerUser"
}

variable "parameter_user_name" {
  type    = string
  default = ""
}

variable "parameter_password_name" {
  type    = string
  default = ""
}

variable "type" {
  type    = string
  default = "SecureString"
}

variable "repository_name" {
  type    = string
  default = ""
}

variable "description" {
  type    = string
  default = ""
}