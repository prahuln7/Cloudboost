variable "name" {
  type        = string
  description = "Name of the Load Balancer to create"
  default     = ""
}
variable "lb_backend_name" {
  type        = string
  description = "Name of the backend address pool"
  default     = ""
}
variable "frontend_ip_configuration_name" {
  type        = string
  description = "Name of the frontend IP configuration"
  default     = ""
}
variable "public_ip_address_id" {
  type        = string
  description = "Here specify the exiting public IP Address ID"
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group in which the Load Balancer will be created"
}
variable "tags" {
  type        = map(any)
  description = "Map of tags to add to create resources"
  default     = {}
}
variable "sku" {
  type        = string
  description = "SKU of the Load Balancer -- Basic or Standard"
  default     = "Basic"
}
variable "subnet_id" {
  type        = string
  description = "ID of the Subnet where the Load Balancer will be deployed"
}
variable "private_ip_address" {
  type        = string
  description = "If 'private_ip_allocation' is set to 'Static', provide a private IP to assign"
}
variable "private_ip_allocation" {
  type        = string
  description = "Define how the private IP address of the VM is allocated -- Static or Dynamic"
  default     = "Dynamic"
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