output "private_dns_zone_id" {
  value       = azurerm_private_dns_zone.main.id
  description = "This is giving the Id of dns zone in azure"
}