resource "aws_iam_user" "this" {
  name = var.user_name
  path = var.path

  tags = { "Name" = var.user_name }
}

resource "aws_iam_service_specific_credential" "this" {
  service_name = var.service_name
  user_name    = aws_iam_user.this.name
}

resource "aws_iam_user_policy_attachment" "this" {
  user       = aws_iam_user.this.name
  policy_arn = var.policy_arn
}

### Systems Manager Parameter Store
resource "aws_ssm_parameter" "this_username" {
  name  = var.parameter_user_name
  type  = var.type
  value = aws_iam_service_specific_credential.this.service_user_name
}

resource "aws_ssm_parameter" "this_password" {
  name  = var.parameter_password_name
  type  = var.type
  value = aws_iam_service_specific_credential.this.service_password
}

### Code Commit repo
resource "aws_codecommit_repository" "this" {
  repository_name = var.repository_name
  description     = var.description
}