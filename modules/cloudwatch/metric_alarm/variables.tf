variable "alarm_name" {
  type    = string
  default = ""
}

/*
  - GreaterThanOrEqualToThreshold
  - GreaterThanThreshold
  - LessThanThreshold
  - LessThanOrEqualToThreshold
  - LessThanLowerOrGreaterThanUpperThreshold
  - LessThanLowerThreshold
  - GreaterThanUpperThreshold 
*/
variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold."
  type        = string
  default     = ""
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
  default     = null
}

variable "metric_name" {
  description = "The name for the alarm's associated metric."
  type        = string
  default     = ""
}

variable "namespace" {
  description = "The namespace for the alarm's associated metric."
  type        = string
  default     = ""
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = number
  default     = null
}

/*
  - SampleCount
  - Average
  - Sum
  - Minimum
  - Maximum
*/
variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric."
  type        = string
  default     = "Average"
}
/*
  You cannot create a metric alarm consisting of both 
  "statistic" and "extended_statistic" parameters.
  You must choose one or the other.
*/
variable "extended_statistic" {
  description = "The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100."
  type        = string
  default     = null
}

variable "actions_enabled" {
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state."
  type        = bool
  default     = true
}

variable "alarm_actions" {
  description = "he list of actions to execute when this alarm transitions into an ALARM state from any other state."
  type        = list(any)
  default     = []
}

variable "alarm_description" {
  description = "The description for the alarm."
  type        = string
  default     = ""
}

variable "datapoints_to_alarm" {
  description = "The number of datapoints that must be breaching to trigger the alarm."
  type        = number
  default     = null
}

variable "insufficient_data_actions" {
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state."
  type        = list(any)
  default     = []
}

variable "ok_actions" {
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state."
  type        = list(any)
  default     = []
}

variable "dimensions" {
  description = "The dimensions for the alarm's associated metric."
  type        = map(any)
  default     = {}
}

/*
  - missing
  - ignore
  - breaching
  - notBreaching
  Defaults to missing.
*/
variable "treat_missing_data" {
  description = "Sets how this alarm is to handle missing data points."
  type        = string
  default     = "missing"
}

variable "threshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
  default     = null
}

variable "tags" {
  type    = map(any)
  default = {}
}