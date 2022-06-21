output "resource_id" {
  description = "Id of the Network gateway."
  value       = azurerm_nat_gateway.gw.id
}
output "nat_gateway_ip" {
  description = "ip of the NAT_Gateway"
  value       = data.azurerm_public_ip.public_ip.ip_address
}