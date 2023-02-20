data "aws_iam_account_alias" "alias" {}
data "aws_region" "current" {}

resource "aws_s3_bucket" "this" {
  bucket = "${data.aws_iam_account_alias.alias.account_alias}-${data.aws_region.current.name}-${var.name}"
  tags   = var.tags
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.versioning ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Disable Bucket ACLs https://aws.amazon.com/blogs/aws/new-simplify-access-management-for-data-stored-in-amazon-s3/
resource "aws_s3_bucket_ownership_controls" "this" {
  count  = var.disable_acls ? 1 : 0
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  count  = var.public_access_block ? 1 : 0
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
