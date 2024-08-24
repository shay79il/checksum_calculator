## variables.tf

variable "region" {
  type        = string
  description = "The AWS region where resources will be deployed"
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket where objects will be uploaded"
}

variable "lambda_role_name" {
  type        = string
  description = "The name of the IAM role for the Lambda function"
  default     = "lambda-s3-md5-calculator-role"
}