variable "service_bus_namespace" {
  description = "Name of the service bus namespace"
}
variable "service_bus_queue_namespace_rule" {
  description = "Name of the service bus queue namespace rule"
}

variable "service_bus_queuename" {
  description = "Name of the service bus queue"
}

variable "service_bus_topicname" {
  description = "Name of the service bus topic"
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"
}

variable "location" {
  description = "Azure region where the storage account will be located"
}

