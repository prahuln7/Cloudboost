output "monitoring_vm_id" {
  description = "The ID of the virtual machine"
  value       = element(coalescelist(azurerm_virtual_machine.main.*.id, [""]), 0)
}