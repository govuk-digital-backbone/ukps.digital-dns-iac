resource "aws_route53_record" "scw-test-zone" {
  zone_id         = aws_route53_zone.ukpsdigital.zone_id
  allow_overwrite = true
  name            = "scw-test"
  ttl             = local.standard_ttl
  type            = "NS"

  records = [
    "ns0.dom.scw.cloud.",
    "ns1.dom.scw.cloud."
  ]
}
