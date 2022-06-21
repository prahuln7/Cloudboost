variable "resource_group_name" {
  description = "Name of the resource group for Cname to be deployed to"
  type        = string
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}
variable "applicationname" {
  type        = string
  description = "Name of the application name"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
variable "name" {
  type        = string
  description = "The name of the DNS CNAME Record"
  default     = ""
}
variable "zone_name" {
  type        = string
  description = "Specifies the DNS Zone where the resource exists"
}
variable "ttl" {
  type        = number
  description = "The Time To Live (TTL) of the DNS record in seconds"
}
variable "record" {
  type        = string
  description = "The target of the CNAME"
}
