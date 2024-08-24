## modules/s3/main.tf

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*"
    ]
    resources = [
      aws_s3_bucket.bucket.arn,
      "${aws_s3_bucket.bucket.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "s3_policy" {
  name   = "s3-policy"
  policy = data.aws_iam_policy_document.policy_document.json
}

resource "aws_iam_role_policy_attachment" "s3_policy" {
  role       = var.lambda_role_name
  policy_arn = aws_iam_policy.s3_policy.arn
}

