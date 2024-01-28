variable "name" {
  type    = string
  default = ""
}

variable "s3_bucket_name" {
  type    = string
  default = ""
}

variable "include_global_service_events" {
  type    = bool
  default = false
}

variable "enable_logging" {
  type    = bool
  default = true
}

variable "enable_log_file_validation" {
  type    = bool
  default = false
}

variable "is_multi_region_trail" {
  type    = bool
  default = false
}

variable "cloud_watch_logs_role_arn" {
  type    = string
  default = ""
}

variable "cloud_watch_logs_group_arn" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}