resource "aws_route53_zone" "observability" {
  name = "observability.ukps.digital"

  tags = merge(local.default_tags, {
    "Name" : "observability.ukps.digital",
    "Environment" : "prod"
  })
}

resource "aws_route53_record" "observability-delegated-zone" {
  zone_id         = aws_route53_zone.ukpsdigital.zone_id
  allow_overwrite = true
  name            = "observability"
  ttl             = local.standard_ttl
  type            = "NS"

  records = aws_route53_zone.observability.name_servers
}

resource "aws_route53_record" "nonprod-monitoring-delegated-zone" {
  zone_id         = aws_route53_zone.observability.zone_id
  allow_overwrite = true
  name            = "monitoring.nonprod"
  ttl             = local.standard_ttl
  type            = "NS"

  records = [
    "ns-951.awsdns-54.net.",
    "ns-1032.awsdns-01.org.",
    "ns-2026.awsdns-61.co.uk.",
    "ns-88.awsdns-11.com."
  ]
}

resource "aws_route53_record" "prod-monitoring-delegated-zone" {
  zone_id         = aws_route53_zone.observability.zone_id
  allow_overwrite = true
  name            = "monitoring.prod"
  ttl             = local.standard_ttl
  type            = "NS"

  records = [
    "ns-1994.awsdns-57.co.uk.",
    "ns-252.awsdns-31.com.",
    "ns-1115.awsdns-11.org.",
    "ns-672.awsdns-20.net."
  ]
}

resource "aws_route53_record" "nonprod-legacy-delegated-zone" {
  zone_id         = aws_route53_zone.observability.zone_id
  allow_overwrite = true
  name            = "legacy.nonprod"
  ttl             = local.standard_ttl
  type            = "NS"

  records = [
    "ns-1089.awsdns-08.org.",
    "ns-647.awsdns-16.net.",
    "ns-320.awsdns-40.com.",
    "ns-2011.awsdns-59.co.uk."
  ]
}
