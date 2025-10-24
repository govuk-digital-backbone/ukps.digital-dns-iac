resource "aws_route53_record" "matrix-zone" {
  zone_id         = aws_route53_zone.ukpsdigital.zone_id
  allow_overwrite = true
  name            = "matrix"
  ttl             = local.standard_ttl
  type            = "NS"

  records = [
    "ns-67.awsdns-08.com.",
    "ns-712.awsdns-25.net.",
    "ns-1059.awsdns-04.org.",
    "ns-1793.awsdns-32.co.uk."
  ]
}
