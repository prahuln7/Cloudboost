variable "resource_group" {
  description = "Enter resource group for create action group and alert."
  type        = string
}
variable "applicationname" {
  description = "Name of the applicationname"
  type        = string
}
variable "environment" {
  description = "Name of the environment"
  type        = string
}
variable "name" {
  description = "Name of the Resources"
  type        = string
}
variable "storage_account_name" {
  description = "Name of the existing storage account"
  type        = string

}
variable "server_version" {
  description = "The version for the database server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
  type        = string
  default     = "12.0"
}
variable "sql_admin_username" {
  description = "The administrator username of the SQL Server."
  type        = string
}
variable "sql_password" {
  description = "The administrator password of the SQL Server."
  type        = string
}
variable "storage_account_access_key_is_secondary" {
  description = "Specifies whether storage_account_access_key value is the storage's secondary key."
  type        = bool
  default     = true
}
variable "retention_in_days" {
  description = "Days to retain "
  type        = number
  default     = "6"
}
variable "tags" {
  description = "Map of tags to add to create resources"
  type        = map(string)
  default     = {}
}