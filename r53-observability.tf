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
