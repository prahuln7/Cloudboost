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
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}