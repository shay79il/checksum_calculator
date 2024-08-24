## modules/s3/data.tf

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutBucketPolicy"
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.bucket.id}",
      "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::428855609275:root"]
    }
  }
}