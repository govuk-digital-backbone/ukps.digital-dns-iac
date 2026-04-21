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

resource "aws_route53_record" "playground-delegated-zone" {
  zone_id         = aws_route53_zone.observability.zone_id
  allow_overwrite = true
  name            = "playground"
  ttl             = local.standard_ttl
  type            = "NS"

  records = [
    "ns-1462.awsdns-54.org.",
    "ns-1696.awsdns-20.co.uk.",
    "ns-265.awsdns-33.com.",
    "ns-524.awsdns-01.net."
  ]
}

resource "aws_route53_record" "nonprod-legacy-delegated-zone" {
  zone_id         = aws_route53_zone.observability.zone_id
  allow_overwrite = true
  name            = "legacy.nonprod"
  ttl             = local.standard_ttl
  type            = "NS"

  records = [
    "ns-2035.awsdns-62.co.uk.",
    "ns-1361.awsdns-42.org.",
    "ns-662.awsdns-18.net.",
    "ns-57.awsdns-07.com."
  ]
}

resource "aws_route53_record" "prod-legacy-delegated-zone" {
  zone_id         = aws_route53_zone.observability.zone_id
  allow_overwrite = true
  name            = "legacy.prod"
  ttl             = local.standard_ttl
  type            = "NS"

  records = [
    "ns-2046.awsdns-63.co.uk.",
    "ns-1168.awsdns-18.org.",
    "ns-601.awsdns-11.net.",
    "ns-322.awsdns-40.com."
  ]
}
