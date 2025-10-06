resource "routeros_system_certificate" "local-root-ca-cert" {
  name        = "local-root-cert"
  common_name = "local-cert"
  key_size    = "prime256v1"
  key_usage   = ["key-cert-sign", "crl-sign"]
  trusted     = true
  sign {}

  lifecycle { ignore_changes = [ sign ] }
}

resource "routeros_system_certificate" "webfig" {
  name        = "webfig"
  common_name = "192.168.62.1"

  country      = "PH"
  locality     = "MLA"
  organization = "Digital"
  unit         = "automation"
  days_valid   = 3650

  key_usage = ["key-cert-sign", "crl-sign", "digital-signature", "key-agreement", "tls-server"]
  key_size  = "prime256v1"

  trusted = true
  sign { ca = routeros_system_certificate.local-root-ca-cert.name }

  lifecycle { ignore_changes = [ sign ] }
}

# CERTIFICATE
# :put [/certificate get [print show-ids]]
import {
  to = routeros_system_certificate.local-root-ca-cert
  id = "*D"
}
import {
  to = routeros_system_certificate.webfig
  id = "*E"
}
