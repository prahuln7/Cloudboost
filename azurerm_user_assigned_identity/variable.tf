variable "resource-group_name" {
  type        = string
  description = "Name of the Resource group to be created"
}
variable "name" {
  description = "Name of user assaigned isdentity"
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

