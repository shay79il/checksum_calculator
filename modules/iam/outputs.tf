## modules/iam/outputs.tf

output "lambda_role_arn" {
  value       = aws_iam_role.lambda_execution_role.arn
  description = "The ARN of the Lambda execution function"
}

output "lambda_role_name" {
  value       = aws_iam_role.lambda_execution_role.name
  description = "The name of the Lambda execution function"
}