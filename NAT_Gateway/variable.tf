variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
  type        = string
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
variable "applicationname" {
  type        = string
  description = "Name of the applicationname"
}
variable "name" {
  type        = string
  description = "Name of the NAT_Gateway"
}
variable "ipname" {
  description = "Name of the Public ip address"
  type        = string
}
variable "sku_name" {
  description = "The SKU which should be used. At this time the only supported value is Standard."
  default     = "Standard"
  type        = string
}
variable "prefix_length" {
  description = "The size of the prefix size e.g 28(16 addresses), 29(8 addresses), 30(4 addresses),31(2 addresses)"
  type        = number
}
variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}