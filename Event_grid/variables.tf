variable "event_grid_subname" {
  description = "Name of the eventgrid event subscription"
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"
}

variable "scope_resource_group_id" {
  description = "Name of the resource group where the storage account belongs"
}

variable "location" {
  description = "Azure region where the storage account will be located"
  default     = "centralus"
}

#variable "queue_primary_connection_string" {
#  description = "queue_primary_connection_string"
#}
