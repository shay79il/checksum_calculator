## main.tf

module "iam" {
  source           = "./modules/iam"
  lambda_role_name = var.lambda_role_name
}

module "s3" {
  source           = "./modules/s3"
  bucket_name      = local.bucket_name
  lambda_role_name = module.iam.lambda_role_name
}

module "lambda" {
  source          = "./modules/lambda"
  bucket_name     = local.bucket_name
  bucket_arn      = module.s3.bucket_arn
  lambda_role_arn = module.iam.lambda_role_arn
}