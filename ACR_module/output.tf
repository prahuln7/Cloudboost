output "id" {
  value = azurerm_container_registry.main.id
}
output "login_server" {
  value = azurerm_container_registry.main.login_server
}
output "admin_username" {
  value = azurerm_container_registry.main.admin_username
}
output "admin_password" {
  value = azurerm_container_registry.main.admin_password
}
output "principal_id" {
  value = azurerm_container_registry.main.identity.0.principal_id
}
output "tenant_id" {
  value = azurerm_container_registry.main.identity.0.tenant_id
}
output "name" {
  value = azurerm_container_registry.main.name
}
