variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"
  type        = string
}
variable "name" {
  type        = string
  description = "Name of the root module deployed to"
  default     = "linuxvm"
}
variable "vm_size" {
  description = "The Virtual Machine SKU for the Virtual Machine, Default is Standard_DS1_V2"
  type        = string
  default     = "Standard_DS1_V2"
}
variable "network_interface_ids" {
  description = "Azure vm vm private ip allocation method"
  type        = string
  default     = ""
}
variable "osdisk_name" {
  description = "name of the os disk"
  type        = string
  default     = "linuxosdisk"
}
variable "os_caching" {
  description = "os catching type"
  type        = string
  default     = "ReadWrite"
}
variable "os_create_option" {
  description = "os creation option source"
  type        = string
  default     = "FromImage"
}
variable "managed_disk_type" {
  description = "type of the disk"
  type        = string
  default     = "Standard_LRS"
}
variable "computer_name" {
  description = "name of the computer name"
  type        = string
  default     = ""
}
variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine."
  type        = string
  default     = ""
}
variable "admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine"
  type        = string
  default     = ""
}
variable "contact" {
  description = "contact name"
  type        = string
  default     = ""
}
variable "ssh_public_key" {
  description = "specify the path to the existing SSH key to authenticate Linux virtual machine"
  type        = string
  default     = ""
}
variable "search_image_name" {
  description = "name of the image name from azure portal"
  type        = string
  default     = ""
}
variable "resource_group_image" {
  description = "name of the resource group image"
  type        = string
  default     = ""
}
variable "applicationname" {
  description = "Name of the applicationname"
  type        = string
}
variable "environment" {
  description = "Name of target environment."
  type        = string
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}