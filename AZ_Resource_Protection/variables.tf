variable "resource_group_name" {
  type        = string
  description = "The resource groups to protect"
  default     = ""
}
variable "resource_groups" {
  type        = set(string)
  description = "The resource groups to protect"
  default     = [""]
}
variable "lock_level" {
  type        = string
  description = "Either CanNotDelete or ReadOnly"
  default     = "CanNotDelete"
}
variable "tags" {
  type        = map(any)
  description = "Map of tags to add to create resources"
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