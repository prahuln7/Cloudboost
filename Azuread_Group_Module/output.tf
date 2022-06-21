output "adgroup_object_id" {
  value       = azuread_group.main.object_id
  description = "The object ID of the group"
}
