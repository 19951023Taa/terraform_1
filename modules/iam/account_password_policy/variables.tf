variable "minimum_password_length" {
  type    = string
  default = ""
}

variable "require_lowercase_characters" {
  type    = bool
  default = true
}

variable "require_numbers" {
  type    = bool
  default = true
}

variable "require_uppercase_characters" {
  type    = bool
  default = true
}

variable "require_symbols" {
  type    = bool
  default = true
}

variable "max_password_age" {
  type    = string
  default = ""
}

variable "hard_expiry" {
  type    = bool
  default = false
}

variable "allow_users_to_change_password" {
  type    = bool
  default = true
}

variable "password_reuse_prevention" {
  type    = string
  default = true
}