variable "resource_group" {
  description = "Enter resource group for create action group and alert."
  type        = string
}
variable "application_name" {
  description = "Name of the applicationname"
  type        = string
}
variable "environment" {
  description = "Name of the environment"
  type        = string
}
variable "name" {
  description = "Name of the resources"
  type        = string
}
variable "storage_account_name" {
  description = "Name of the existing Storage account"
  type        = string
}
variable "os_type" {
  description = "Operating System Type"
  type        = string
  default     = "Windows"
}
variable "sku_name" {
  description = "Name of the SKU capability. Dynamic - A function consumption plan."
  type        = string
  default     = "Y1"
}
variable "always_on" {
  description = "If this Windows Web App is Always On enabled. Defaults to false"
  type        = bool
  default     = false
}