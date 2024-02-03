output "username" {
  description = "username"
  value = length(module.iam_users) > 0 ? {
    for user, user_data in local.users : user => module.iam_users["${user}"].username
  } : {}
}