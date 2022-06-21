variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the storage account belongs"
}
variable "subnet_web_id" {
  type        = string
  description = "The Subnet id of Subnet Already Created"
}
variable "name" {
  type        = string
  description = "Name of the Network Interface"
  default     = ""
}
variable "ip_config_name" {
  type        = string
  description = "Name of the Network Interface"
  default     = "internal"
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}
variable "private_ip_address_allocation" {
  type        = string
  description = "Azure vm vm private ip allocation method"
  default     = "Dynamic"
}
variable "applicationname" {
  type        = string
  description = "Name of the application"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
