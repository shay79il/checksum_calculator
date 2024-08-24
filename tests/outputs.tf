## outputs.tf

output "bucket_name" {
  value       = module.checksum_calculator.bucket_name
  description = "The name of the S3 bucket where objects will be uploaded"
}

output "lambda_function_name" {
  value       = module.checksum_calculator.lambda_function_name
  description = "The name of the Lambda function"
}