variable "resource_group" {
  type        = string
  description = "Enter resource group for create action group and alert."
}
variable "sql_virtual_machine_name" {
  type        = string
  description = "Name of the existing SQL Virtual Machine"
}
variable "sql_license_type" {
  type        = string
  description = "The SQL Server license type. Possible values are AHUB (Azure Hybrid Benefit) and PAYG (Pay-As-You-Go)"
  default     = "PAYG"
}
variable "r_services_enabled" {
  type        = bool
  description = "Should R Services be enabled"
  default     = true
}
variable "sql_connectivity_port" {
  type        = number
  description = "The SQL Server port. Defaults to 1433."
  default     = 1433
}
variable "sql_connectivity_type" {
  type        = string
  description = "The connectivity type used for this SQL Server. Defaults to PRIVATE."
  default     = "PRIVATE"
}
variable "sql_connectivity_update_password" {
  type        = string
  description = "The SQL Server sysadmin login password."
}
variable "sql_connectivity_update_username" {
  type        = string
  description = "The SQL Server sysadmin login to create."
}
variable "tags" {
  description = "Map of tags to add to create resources"
  type        = map(string)
  default     = {}
}
variable "day_of_week" {
  type        = string
  description = "The day of week to apply the patch on."
  default     = "Sunday"
}
variable "maintenance_window_duration_in_minutes" {
  type        = number
  description = "The size of the Maintenance Window in minutes."
  default     = 60
}
variable "maintenance_window_starting_hour" {
  type        = number
  description = "The Hour, in the Virtual Machine Time-Zone when the patching maintenance window should begin."
  default     = 2
}

