
variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"

}

variable "location" {
  description = "Azure region where the storage account will be located"
}

variable "function_verion" {
  default     = "~3"
  description = "The runtime version the function app should have."
}

variable "function_app_name" {
  description = "Name of the function app"
}

variable "app_service_plan_id" {
  description = "Name of the app service plan id of App service plan "
}

variable "storage_account_name" {
  description = "Name of the storage account"
}

variable "primary_access_key" {
  description = "Storage account access key"
}

variable "instrumentation_key" {
  description = "Name of the instrumentation key of application insights"
}
