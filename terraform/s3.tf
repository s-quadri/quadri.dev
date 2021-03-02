resource "aws_s3_bucket" "sophia-quadri-dev" {
  bucket = "sophia.quadri.dev"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "sophia-quadri-dev" {
  for_each = fileset("../dist/sophia.quadri.dev", "**")

  bucket       = aws_s3_bucket.sophia-quadri-dev.id
  key          = each.key
  content_type = "text/html"
  acl          = "public-read"

  source = "../dist/sophia.quadri.dev/${each.key}"
  etag   = filemd5("../dist/sophia.quadri.dev/${each.key}")
}

resource "aws_s3_bucket" "quadri-dev" {
  bucket = "quadri.dev"
  acl    = "public-read"

  website {
    redirect_all_requests_to = "https://sophia.quadri.dev"
  }
}
