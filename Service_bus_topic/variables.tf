variable "service_bus_namespace" {
  description = "Name of the service bus namespace"
}

variable "service_bus_topicname" {
  description = "Name of the service bus topic"
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"
}

variable "location" {
  description = "Azure region where the storage account will be located"
  default     = "centralus"
}

