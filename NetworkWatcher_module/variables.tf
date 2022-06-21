variable "name" {
  type        = string
  description = "Name of the network watcher"
  default     = ""
}
variable "applicationname" {
  type        = string
  description = "Name of the application"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group. When no subnet name is given than the resource group name must be in the Sogeti naming format."
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}

