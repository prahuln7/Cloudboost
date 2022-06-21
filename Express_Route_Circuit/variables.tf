variable "name" {
  description = "The name of the ExpressRoute circuit. Changing this forces a new resource to be created."
  type        = string
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
variable "resource_group_name" {
  description = "The name of the resource group in which to create the ExpressRoute circuit. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}
variable "provider_name" {
  description = "The name of the ExpressRoute Service Provider. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}
variable "peering_location" {
  description = " The name of the peering location and not the Azure resource location. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}
variable "tier" {
  description = "Mention the tier of the express route circuit.Possible values are Basic, Local, Standard or Premium."
  type        = string
  default     = "Basic"
}
variable "family" {
  description = "The billing mode for bandwidth. Possible values are MeteredData or UnlimitedData."
  type        = string
  default     = "MeteredData"
}
variable "bandwidth_in_mbps" {
  description = "Mention the Bandwidth in mbps of the express route circuit"
  type        = number
  default     = 100
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}
