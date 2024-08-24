## modules/lambda/main.tf

data "archive_file" "checksum_calculator" {
  type        = "zip"
  source_file = "${path.module}/checksum_calculator.py"
  output_path = "${path.module}/checksum_calculator.zip"
}

resource "aws_lambda_function" "checksum_calculator" {
  filename         = data.archive_file.checksum_calculator.output_path
  function_name    = "checksum_calculator"
  role             = var.lambda_role_arn
  handler          = "checksum_calculator.lambda_handler"
  runtime          = "python3.9"
  source_code_hash = data.archive_file.checksum_calculator.output_base64sha256

  environment {
    variables = {
      BUCKET_NAME = var.bucket_name
    }
  }
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.checksum_calculator.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.bucket_arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.bucket_name

  lambda_function {
    lambda_function_arn = aws_lambda_function.checksum_calculator.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".pdf"
  }

  depends_on = [aws_lambda_permission.allow_s3]
}
