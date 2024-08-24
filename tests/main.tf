
module "checksum_calculator" {
  source           = "../"
  bucket_name      = "your-s3-bucket-name-test"
  region           = "us-east-1"
  lambda_role_name = "lambda-role-name-test"
}