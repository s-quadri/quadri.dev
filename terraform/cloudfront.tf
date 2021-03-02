locals {
  origin_id = "S3-Website-${aws_s3_bucket.sophia-quadri-dev.website_endpoint}"
}

resource "aws_cloudfront_distribution" "sophia-quadri-dev" {
  comment         = "sophia.quadri.dev"
  enabled         = true
  is_ipv6_enabled = true
  price_class     = "PriceClass_100"

  origin {
    domain_name = aws_s3_bucket.sophia-quadri-dev.website_endpoint
    origin_id   = local.origin_id

    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = 30
      origin_ssl_protocols = [
        "TLSv1",
        "TLSv1.1",
        "TLSv1.2",
      ]
    }
  }

  default_root_object = "index.html"

  aliases = [
    "sophia.quadri.dev",
    "quadri.dev",
    "www.quadri.dev",
    "www.sophia.quadri.dev"
  ]

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.origin_id

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.sophia-quadri-dev.arn
    minimum_protocol_version = "TLSv1"
    ssl_support_method       = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
