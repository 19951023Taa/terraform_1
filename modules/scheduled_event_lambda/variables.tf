variable "name" {
  description = "name"
  type        = string
  default     = ""
}

variable "description" {
  description = "description"
  type        = string
  default     = ""
}

variable "role_arn" {
  description = "role_arn"
  type        = string
  default     = ""
}

variable "state" {
  description = "Whether this event is enabled or not"
  type        = string
  default     = "ENABLED"
}

variable "tags" {
  description = "tags"
  type        = map(any)
  default     = {}
}

/*  
    See the document below
    https://docs.aws.amazon.com/ja_jp/eventbridge/latest/userguide/eb-create-rule-schedule.html#eb-cron-expressions 
*/
variable "schedule_expression" {
  description = "cron fomula"
  type        = string
  default     = null
}

/*  
    Wrote in json
*/
variable "event_pattern" {
  description = "event_pattern"
  type        = string
  default     = ""
}

variable "target_id" {
  description = "The unique target assignment ID. If missing, will generate a random, unique id."
  type        = string
  default     = ""
}

variable "target_arn" {
  description = " (Required) The Amazon Resource Name (ARN) of the target."
  type        = string
  default     = ""
}

variable "input" {
  description = " (Optional) Valid JSON text passed to the target."
  type        = string
  default     = ""
}

variable "statement_id" {
  type    = string
  default = "AllowExecutionFromEventBridge"
}

variable "action" {
  type    = string
  default = "lambda:InvokeFunction"
}

variable "principal" {
  type    = string
  default = "events.amazonaws.com"
}

variable "lambda_function_name" {
  type    = string
  default = ""
}
