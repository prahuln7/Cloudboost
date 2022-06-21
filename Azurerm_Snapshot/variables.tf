variable "applicationname" {
  type        = string
  description = "Name of the application"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the snapshot."
  type        = string
}
variable "name" {
  description = "name of the snapshot"
  type        = string
}
variable "source_uri" {
  description = "the name of the disk to be created"
  type        = string
}
variable "create_option" {
  description = "Indicates how the snapshot is to be created."
  type        = string
  default     = "Copy"
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}