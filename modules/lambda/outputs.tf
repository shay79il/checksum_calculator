## modules/lambda/outputs.tf

output "name" {
  value       = aws_lambda_function.checksum_calculator.function_name
  description = "The name of the Lambda function"
}