variable "name" {
  type        = string
  description = "Name of sql server"
}
variable "resource_group_name" {
  type        = string
  description = "resource group name as per cloud boost naming coneventions"
}
variable "environment" {
  type        = string
  description = "Name of target environment"
}
variable "tags" {
  type        = map(any)
  description = "Map of tags to add to create resources"
  default     = {}
}
variable "applicationname" {
  type        = string
  description = "applicationname requierd"
}
variable "administrator_login" {
  type        = string
  description = "administrator_login "
}
variable "administrator_login_password" {
  type        = string
  description = "administrator_login_password "
}
variable "sql_version" {
  type        = string
  description = "required server version"
  default     = "12.0"
}