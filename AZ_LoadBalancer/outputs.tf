output "load_balancer_id" {
  description = "ID of the Load Balancer"
  value       = azurerm_lb.main.id
}
output "name" {
  description = "Name of the Load Balancer"
  value       = "${var.name}-lb"
}
output "private_ip_addresses" {
  description = "List of IP addresses assigned to the Load Balancer"
  value       = azurerm_lb.main.private_ip_addresses
}
output "ip_config" {
  description = "Frontend IP configuration of the Load Balancer"
  value       = azurerm_lb.main.frontend_ip_configuration
}
output "ip_config_name" {
  description = "Name of the Frontend IP configuration of the Load Balancer"
  value       = "${var.name}-ip-config"
}
output "backend_address_pool_id" {
  description = "ID of the backend address pool of the Load Balancer"
  value       = azurerm_lb_backend_address_pool.main.id
}