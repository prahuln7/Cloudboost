variable "service_bus_namespace" {
  description = "Name of the service bus namespace"
}

variable "service_bus_queuename" {
  description = "Name of the service bus queue"
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"
}

variable "location" {
  description = "Azure region where the storage account will be located"
  default     = "centralus"
}

variable "requires_session" {
  description = "session required for service or not"
}
