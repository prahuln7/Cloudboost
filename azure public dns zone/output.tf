output "azurerm_dns_zone" {
  description = "Id of the public dns zone"
  value       = azurerm_dns_zone.main-public.name
}