output "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint."
  value       = aws_vpc_endpoint.this.id
}

output "vpc_endpoint_arn" {
  description = " The Amazon Resource Name (ARN) of the VPC endpoint."
  value       = aws_vpc_endpoint.this.arn
}

output "vpc_endpoint_prefix_list_id" {
  description = "The prefix list ID of the exposed AWS service. Applicable for endpoints of type Gateway."
  value       = aws_vpc_endpoint.this.prefix_list_id
}