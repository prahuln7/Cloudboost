output "mssql_vm_id" {
  description = "ID of the MSSQL Virtual Machine"
  value       = azurerm_mssql_virtual_machine.main.id
}