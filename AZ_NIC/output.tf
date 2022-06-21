output "azure_vm_nic_ip_integration" {
  description = "The public IP of the virtual machine"
  value       = azurerm_network_interface.main.id
}