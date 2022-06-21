variable "name" {
  type        = string
  description = "Name of the storage container"
  default     = ""
}
variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group where the storage account lives. When no storage account name is given than the resource group name must be in the Sogeti naming format."
  default     = ""
}
variable "storage_account_name" {
  type        = string
  description = "(Optional)The name of the storage account."
  default     = ""
}
variable "storage_container_name" {
  type        = string
  description = "(Optional)The name of the container in storage account."
  default     = ""
}
variable "blob_type" {
  type        = string
  description = "The type of the storage blob to be created. Possible values are Append, Block or Page"
  default     = "Block"
}
variable "blob_source" {
  type        = string
  description = " An absolute path to a file on the local system. This field cannot be specified for Append blobs and cannot be specified if source_content or source_uri is specified."
  default     = ""
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