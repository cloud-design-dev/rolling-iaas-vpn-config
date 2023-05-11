module "resource_group" {
  source                       = "git::https://github.com/terraform-ibm-modules/terraform-ibm-resource-group.git?ref=v1.0.5"
  resource_group_name          = null
  existing_resource_group_name = var.resource_group
}

data "ibm_is_vpn_server" "tor" {
  name = var.vpn_server_name
}

data "ibm_resource_instance" "sm_instance" {
  name              = var.sm_instance_name
  location          = var.region
  resource_group_id = module.resource_group.resource_group_id
}

data "ibm_is_vpn_server_client_configuration" "client" {
  vpn_server = data.ibm_is_vpn_server.tor.id
}

data "ibm_sm_arbitrary_secret" "vpn_cert" {
  instance_id = data.ibm_resource_instance.sm_instance.guid
  region      = var.region
  secret_id   = var.vpn_cert_secret_id
}

data "ibm_sm_arbitrary_secret" "vpn_key" {
  instance_id = data.ibm_resource_instance.sm_instance.guid
  region      = var.region
  secret_id   = var.vpn_key_secret_id
}

resource "local_file" "fullconfig" {
  content  = <<EOT
${data.ibm_is_vpn_server_client_configuration.client.vpn_server_client_configuration}

<cert>
${data.ibm_sm_arbitrary_secret.vpn_cert.payload}
</cert>

<key>
${data.ibm_sm_arbitrary_secret.vpn_key.payload}
</key>
EOT
  filename = "./client-full.ovpn"
}