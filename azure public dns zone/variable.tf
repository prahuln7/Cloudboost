variable "resource_group" {
  description = "Name of resource group to deploy resources in"
  type        = string
}
variable "applicationname" {
  description = "The name of the application"
  type        = string
}
variable "environment" {
  description = "Name of the environment"
  type        = string
}
variable "name" {
  description = "The name of the zone"
  type        = string
}