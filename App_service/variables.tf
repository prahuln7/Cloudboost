
variable "app_service_name" {
  description = "The name for the app service. Without environment naming."
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"
}

variable "location" {
  description = "Azure region where the storage account will be located"
}

variable "app_service_plan_id" {
  description = "app service plan id"
}
