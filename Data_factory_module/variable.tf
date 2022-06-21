variable "resource_group_name" {
  description = "Name of the Resource group to be created"
  type        = string
}
variable "name" {
  description = "Name of Data factory"
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
  description = "A list of tags to be applied"
  type        = map(any)
  default     = {}
}