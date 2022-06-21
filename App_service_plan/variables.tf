
variable "app_service_plan_name" {
  description = "The name for the service plan. Without environment naming."
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"
}

variable "location" {
  description = "Azure region where the storage account will be located"
}


variable "skutier" {
  description = "tier of sku in app service plan"
}

variable "skusize" {
  description = "size of sku in app service plan"
}

variable "kind" {
  description = "kind of app service plan"
}
