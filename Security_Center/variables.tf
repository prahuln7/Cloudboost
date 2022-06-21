variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
  type        = string
}
variable "environment" {
  type        = string
  description = "Name of target environment"
}
variable "applicationname" {
  type        = string
  description = "Name of the applicationname"
}
variable "tags" {
  type        = map(string)
  description = "Map of tags to add to create resources"
  default     = {}
}
variable "security_center_setting_name" {
  type        = string
  description = "The setting to manage. Possible values are `MCAS` and `WDAT`"
  default     = "MCAS"
}
variable "enable_security_center_setting" {
  type        = bool
  description = "Boolean flag to enable/disable data access"
  default     = false
}
variable "security_center_contacts" {
  type        = map(string)
  description = "Manages the subscription's Security Center Contact"
  default     = {}
}
variable "security_center_auto_provisioning" {
  description = "Creates the security_center agent too all the VMs in this subscription automatically"
  type        = string
  default     = "On"
}
variable "security_tier" {
  type        = string
  description = "The Security Center tier : Standard (Mandatory)"
  default     = "Standard"
}
variable "log_analytics_sku" {
  type        = string
  description = "Sets the Log Analytics workspace SKU. Possible values include: Free, Standard, PerGB2018"
  default     = "PerGB2018"
}
variable "retention_in_days" {
  description = "Days to retain logs in Log Analytics"
  type        = number
  default     = "30"
}
variable "resource_type" {
  type        = list(any)
  description = "The resource type this setting affects. Possible values are AppServices, ContainerRegistry, KeyVaults, KubernetesService, SqlServers, SqlServerVirtualMachines, StorageAccounts, VirtualMachines, Arm and Dns."
}
variable "name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}


