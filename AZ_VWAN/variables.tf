variable "name" {
  description = "Name of the virtual wan resource"
  type        = string
  default     = ""
}
variable "resource_group_name" {
  description = "Name of the resource group for vnet to be deployed to."
  type        = string
  default     = ""
}
variable "disable_vpn_encryption" {
  type        = bool
  description = "Boolean flag to specify whether VPN encryption is disabled."
  default     = false
}
variable "allow_branch_to_branch_traffic" {
  type        = bool
  description = "Boolean flag to specify whether branch to branch traffic is allowed"
  default     = true
}
variable "office365_local_breakout_category" {
  type        = string
  description = "Specifies the Office365 local breakout category. Possible values include: Optimize, OptimizeAndAllow, All, None"
  default     = ""
}
variable "type" {
  type        = string
  description = "Specifies the Virtual WAN type. Possible Values include: Basic and Standard."
  default     = "Basic"
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}
variable "hub_names" {
  type        = list(string)
  description = "List of the vHUB names. Should be same length as the `hub_locations` and `address_prefixes`"
  default     = [""]
}
variable "hub_locations" {
  type        = list(string)
  description = "List of the vHUb locations. Should be same length as the `hub_names` and `address_prefixes`"
  default     = [""]
}
variable "address_prefixes" {
  type        = list(string)
  description = "List of the vHUb address prefixes. Should be same length as the `hub_names` and `hub_locations`"
  default     = [""]
}
variable "routes" {
  description = "One or more hub route to create. Routes are mapped to the vhub `hub_names`"
  type        = list(list(object({ address_prefixes = list(string), next_hop_ip_address = string })))
  default     = []
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
