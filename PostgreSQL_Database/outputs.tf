output "server_name" {
  description = "The name of the PostgreSQL server"
  value       = azurerm_postgresql_server.server.name
}
output "server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL server"
  value       = azurerm_postgresql_server.server.fqdn
}
output "administrator_login" {
  value       = var.administrator_login
  description = "Login Id for the server "
}
output "server_id" {
  description = "The resource id of the PostgreSQL server"
  value       = azurerm_postgresql_server.server.id
}
output "db_name" {
  description = "Name of the database"
  value       = azurerm_postgresql_database.db.name
}