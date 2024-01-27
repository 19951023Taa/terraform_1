variable "iam_role_arn" {
  description = "The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group."
  type        = string
  default     = ""
}

variable "log_destination" {
  description = "The ARN of the logging destination."
  type        = string
  default     = ""
}

variable "log_destination_type" {
  description = "The type of the logging destination."
  type        = string
  default     = ""
}

variable "traffic_type" {
  description = " The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL."
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "VPC ID to attach to."
  type        = string
  default     = ""
}

variable "max_aggregation_interval" {
  description = " The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Key-value map of resource tags."
  type        = map(any)
  default     = {}
}

variable "name" {
  type    = string
  default = ""
}