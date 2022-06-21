output "vwan_id" {
  value = azurerm_virtual_wan.main.id
}
output "virtual_hub_ids" {
  description = " The ids of the Virtual Hub."
  value       = compact(concat(azurerm_virtual_hub.main.*.id, [""]))
}