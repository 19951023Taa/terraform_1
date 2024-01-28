variable "backup_plan_name" {
  description = "The display name of a backup plan"
  type        = string
  default     = ""
}

variable "rule_name" {
  description = " An display name for a backup rule"
  type        = string
  default     = ""
}

variable "target_vault_name" {
  description = "The name of a logical container where backups are stored."
  type        = string
  default     = ""
}

variable "schedule" {
  description = "A CRON expression specifying when AWS Backup initiates a backup job."
  type        = string
  default     = ""
}

variable "start_window" {
  description = "The amount of time in minutes before beginning a backup."
  type        = string
  default     = ""
}

variable "completion_window" {
  description = "The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error."
  type        = string
  default     = ""
}

variable "delete_after" {
  description = " Specifies the number of days after creation that a recovery point is deleted."
  type        = string
  default     = ""
}

variable "iam_role_arn" {
  description = "The ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource."
  type        = string
  default     = ""
}

variable "selection_name" {
  description = "Tag-based conditions used to specify a set of resources to assign to a backup plan."
  type        = string
  default     = ""
}

variable "resources_name" {
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan."
  type        = list(any)
  default     = []
}