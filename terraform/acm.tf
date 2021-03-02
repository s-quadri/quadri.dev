resource "aws_acm_certificate" "sophia-quadri-dev" {
  domain_name       = "sophia.quadri.dev"
  validation_method = "DNS"

  subject_alternative_names = [
    "www.sophia.quadri.dev",
    "www.quadri.dev",
    "quadri.dev"
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "sophia-quadri-dev_acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.sophia-quadri-dev.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.quadri-dev.id
}
