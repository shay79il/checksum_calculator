## modules/s3/variables.tf

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket where objects will be uploaded"
}

variable "lambda_role_name" {
  type        = string
  description = "The name of the Lambda execution function"
}