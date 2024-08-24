## modules/lambda/variables.tf

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket where objects will be uploaded"
}

variable "bucket_arn" {
  type        = string
  description = "The ARN of the S3 bucket where objects will be uploaded"
}

variable "lambda_role_arn" {
  type        = string
  description = "The ARN of the IAM role for the Lambda function"
}