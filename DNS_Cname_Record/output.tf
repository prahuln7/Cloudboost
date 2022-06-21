output "dns_cname_id" {
  value       = azurerm_dns_cname_record.main.id
  description = "Id of the dns cname record deployed into dev"
}
