resource "aws_route53_record" "planka-delegated-zone" {
  zone_id         = aws_route53_zone.ukpsdigital.zone_id
  allow_overwrite = true
  name            = "planka"
  ttl             = local.standard_ttl
  type            = "NS"

  records = [
    "ns-1038.awsdns-01.org.",
    "ns-183.awsdns-22.com.",
    "ns-1876.awsdns-42.co.uk.",
    "ns-700.awsdns-23.net."
  ]
}


# resource "aws_route53_record" "planka-ds" {
#  zone_id         = aws_route53_zone.ukpsdigital.zone_id
#  allow_overwrite = true
#  name            = "planka"
#  ttl             = local.standard_ttl
#  type            = "DS"
#  records = [
#    "40425 13 2 B2E93D0CB4E0F345B0580AAEC8CE6825144A813FCB539C483C82B9F747F4CC5B"
#  ]
# }
