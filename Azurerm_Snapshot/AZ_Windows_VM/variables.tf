variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the storage account belongs"
  default     = ""
}
variable "name" {
  type        = string
  description = "Name of virtual network"
  default     = ""
}
variable "monitor_vm_nic_ip" {
  type        = string
  description = "Azure vm vm private ip allocation method"
  default     = ""
}
variable "vm_size" {
  type        = string
  description = "vm_size"
  default     = "Standard_A2_v2"
}
variable "i_offer" {
  type        = string
  description = "offer for the vm"
  default     = "WindowsServer"
}
variable "i_publisher" {
  type        = string
  description = "Publisher for the  vm"
  default     = "MicrosoftWindowsServer"
}
variable "i_sku" {
  type        = string
  description = "sku for the vm"
  default     = "2016-Datacenter"
}
variable "i_version" {
  type        = string
  description = "version for the vm"
  default     = "latest"
}
variable "os_disk_name" {
  type        = string
  description = "os_disk"
  default     = ""
}
variable "add_disk_name" {
  type        = string
  description = "additional_disk"
  default     = ""
}
variable "add_disk_size" {
  type        = string
  description = "disk size in GB"
  default     = "128"
}
variable "caching" {
  type        = string
  description = "Catching type as like ReadWrite"
  default     = "ReadWrite"
}
variable "create_option" {
  type        = string
  description = "Create option as like FromImage"
  default     = "FromImage"
}
variable "managed_disk_type" {
  type        = string
  description = "managed disk type"
  default     = "Standard_LRS"
}
variable "cr_option" {
  type        = string
  description = "Create option as like FromImage or Empty"
  default     = "Empty"
}
variable "lun" {
  type        = number
  description = "lun"
  default     = "0"
}
variable "provision_vm_agent" {
  type        = bool
  description = "provision vm agent as true or false"
  default     = true
}
variable "computer_name" {
  type        = string
  description = "name"
  default     = ""
}
variable "admin_username" {
  type        = string
  description = "name"
}
variable "admin_password" {
  type        = string
  description = "password"
}
variable "create_lmsvm" {
  type        = bool
  description = "lmsvm name"
  default     = true
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
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