variable "name" {
  description = "The name of the delivery channel."
  type        = string
  default     = ""
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket used to store the configuration history."
  type        = string
  default     = ""
}

variable "role_arn" {
  description = "Amazon Resource Name (ARN) of the IAM role."
  type        = string
  default     = ""
}

variable "all_supported" {
  description = "Specifies whether to change the configuration of all supported types of regional resources"
  type        = bool
  default     = true
}

variable "include_global_resource_types" {
  description = "Specifies whether the recorded resources should include global resources of all supported types"
  type        = bool
  default     = true
}

variable "is_enabled" {
  description = "Whether the configuration recorder should be enabled or disabled."
  type        = bool
  default     = true
}