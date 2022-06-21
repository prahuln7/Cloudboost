variable "name" {
  description = "Name of the Express Gateway"
  type        = string
  default     = ""
}
variable "resource_group_name" {
  description = "Name of the resource group for VPN gateway to be deployed to."
  type        = string
}
variable "virtual_hub_name" {
  description = "Name of the virtual Hub id"
  type        = string
  default     = ""
}
variable "address_prefix" {
  type        = string
  description = "Address prefix range"
  default     = ""
}
variable "scale_units" {
  description = "Number of scale units for the Express Gateway"
  type        = number
  default     = 1
}
variable "virtual_hub_id" {
  description = "ID of the virtual HUB that the Express gateway will be deployed to"
  type        = string
  default     = ""
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}
variable "applicationname" {
  description = "Name of the application"
  type        = string
}
variable "environment" {
  description = "Name of the environment"
  type        = string
}
