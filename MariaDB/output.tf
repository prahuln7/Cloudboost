output "mariadb_fqdn" {
  value       = azurerm_mariadb_server.main.fqdn
  description = "FQDN of the mariadb server"
}
output "mariadb_server_id" {
  value       = azurerm_mariadb_server.main.id
  description = "mariadb server ID"
}
output "mariadb_database_id" {
  description = "Database resource id"
  value       = azurerm_mariadb_database.main.id
}
output "mariadb_databases_name" {
  value       = azurerm_mariadb_database.main.name
  description = "Database name"
}
output "mariadb_administrator_login" {
  value       = "${azurerm_mariadb_server.main.administrator_login}@${azurerm_mariadb_server.main.name}"
  description = "Administrator login for mariadb server"
  sensitive   = true
}