locals {
  domain = "ukps.digital"

  default_tags = {
    "Service" : "ukps.digital",
    "Reference" : "https://github.com/govuk-digital-backbone/ukps.digital-dns-iac",
  }

  extra_low_ttl = 30
  low_ttl       = 300
  standard_ttl  = 3600
  long_ttl      = 86400
}
