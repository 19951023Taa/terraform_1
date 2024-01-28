variable "bucket_name" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "policy" {
  type    = string
  default = ""
}

variable "block_public_acls" {
  type    = bool
  default = true
}

variable "block_public_policy" {
  type    = bool
  default = true
}

variable "ignore_public_acls" {
  type    = bool
  default = true
}

variable "restrict_public_buckets" {
  type    = bool
  default = true
}

variable "object_ownership" {
  type    = string
  default = "BucketOwnerPreferred"
}

variable "s3_bucket_lifecycle_name" {
  type    = string
  default = ""
}

variable "status" {
  type    = string
  default = "Enabled"
}

variable "expiration_days" {
  type    = string
  default = ""
}

variable "noncurrent_days" {
  type    = string
  default = ""
}

variable "newer_noncurrent_versions" {
  type    = string
  default = ""
}