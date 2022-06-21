variable "resource_group_name" {
  description = "Name of the resource group for ASG to be deployed to."
  type        = string
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}
variable "applicationname" {
  type        = string
  description = "Name of the applicationname"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
variable "name" {
  type        = string
  description = "Name of the root module deployed to"
  default     = ""
}
variable "storage_account_type" {
    type        = string
    description = "Name of the storage account" 
    default     = "Standard_LRS"
}
variable "create_option" {
    type        = string
    description = "Name of the creation option"
    default     = "Empty"
}
variable "disk_size_gb" {
    type        = number
    description = "Allow Disk Encryption to retrieve from disk size gb"
    default     = "127"
}
