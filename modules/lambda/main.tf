data "archive_file" "this" {
  type        = "zip"
  source_file = var.source_file
  source_dir  = var.source_dir
  output_path = var.output_path
}

resource "aws_lambda_function" "this" {
  filename         = var.output_path
  function_name    = var.lambda_function_name
  role             = var.role
  handler          = var.handler
  runtime          = var.runtime
  timeout          = var.timeout
  source_code_hash = data.archive_file.this.output_base64sha256
  environment  {
    variables    = var.variables
 }
  tags = merge(
    { "Name" = var.lambda_function_name },
    var.tags
  )
}
