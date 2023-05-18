data "ibm_is_vpn_server" "tor" {
  name = var.vpn_server_name
}

data "ibm_is_vpn_server_client_configuration" "client" {
  vpn_server = data.ibm_is_vpn_server.tor.id
  file_path  = "./config/client.ovpn"
}