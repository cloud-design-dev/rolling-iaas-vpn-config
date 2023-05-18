output "client_cert" {
  value     = module.pki.certificates["client"].cert.cert_pem
  sensitive = true
}

output "client_key" {
  value     = module.pki.certificates["client"].private_key.private_key_pem
  sensitive = true
}

resource "local_file" "client_cert" {
  content  = module.pki.certificates["client"].cert.cert_pem
  filename = "../config/client.crt"
}

resource "local_file" "client_key" {
  content  = module.pki.certificates["client"].private_key.private_key_pem
  filename = "../config/client.key"
}