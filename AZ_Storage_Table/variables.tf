variable "name" {
  type        = string
  description = "Name of the storage table"
  default     = ""
}
variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group where the storage account lives. When no storage account name is given than the resource group name must be in the Sogeti naming format."
  default     = ""
}
variable "storage_account_name" {
  type        = string
  description = "(Optional)The name of the storage account."
  default     = ""
}
variable "applicationname" {
  type        = string
  description = "Name of the application"
  default     = ""
}
variable "environment" {
  type        = string
  description = "Name of the environment"
  default     = ""
}