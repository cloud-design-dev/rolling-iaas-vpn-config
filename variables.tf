variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
}

variable "region" {
  description = "The region where the VPC will be created"
  type        = string
  default     = "ca-tor"
}

variable "vpn_server_name" {
  description = "Name of the deployed VPN server"
  type        = string
  default     = "c2svpn-rt-vpn-server"
}

variable "resource_group" {
  description = "Resource group where Secrets manager is depllyed"
  type        = string
  default     = "CDE"
}

variable "vpn_cert_secret_id" {
  description = "Secret ID of the VPN certificate"
  type        = string
}

variable "vpn_key_secret_id" {
  description = "Secret ID of the VPN certificate"
  type        = string
}

variable "sm_instance_name" {
  description = "Name of the Secrets Manager instance"
  type        = string
}