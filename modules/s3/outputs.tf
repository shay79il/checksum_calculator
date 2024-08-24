## modules/s3/outputs.tf

output "bucket_name" {
  value       = aws_s3_bucket.bucket.id
  description = "The name of the S3 bucket where objects will be uploaded"
}

output "bucket_arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "The ARN of the S3 bucket where objects will be uploaded"
}