## outputs.tf

output "bucket_name" {
  value       = module.s3.bucket_name
  description = "The name of the S3 bucket where objects will be uploaded"
}

output "lambda_function_name" {
  value       = module.lambda.name
  description = "The name of the Lambda function"
}