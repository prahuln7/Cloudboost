output "resourceid" {
  description = "the resource id of the A record"
  value       = azurerm_dns_a_record.a_record.id
}