resource "aws_route53_zone" "quadri-dev" {
  name = "quadri.dev."
}

resource "aws_route53_record" "sophia-quadri-dev" {
  zone_id = aws_route53_zone.quadri-dev.id
  name    = "sophia.quadri.dev"
  type    = "CNAME"
  ttl     = "3600"
  records = [aws_cloudfront_distribution.sophia-quadri-dev.domain_name]
}

resource "aws_route53_record" "quadri-dev" {
  zone_id = aws_route53_zone.quadri-dev.id
  name    = "quadri.dev"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.sophia-quadri-dev.domain_name
    zone_id                = aws_cloudfront_distribution.sophia-quadri-dev.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www-quadri-dev" {
  zone_id = aws_route53_zone.quadri-dev.id
  name    = "www.quadri.dev"
  type    = "CNAME"
  ttl     = "3600"
  records = [aws_route53_record.sophia-quadri-dev.name]
}

resource "aws_route53_record" "www-sophia-quadri-dev" {
  zone_id = aws_route53_zone.quadri-dev.id
  name    = "www.sophia.quadri.dev"
  type    = "CNAME"
  ttl     = "3600"
  records = [aws_route53_record.sophia-quadri-dev.name]
}
