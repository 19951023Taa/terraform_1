output "groupname" {
  value = try(aws_iam_group.this[0].name, null)
}
