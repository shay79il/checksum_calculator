## locals.tf

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
}

locals {
  bucket_name = "${var.bucket_name}-${lower(random_string.bucket_suffix.result)}"
}
