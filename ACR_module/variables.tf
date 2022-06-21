variable "name" {
  type        = string
  description = "The name of the Container Registry. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type = string
}
variable "admin_enabled" {
  type    = bool
  default = true
}
variable "sku" {
  description = "(Optional) The SKU name of the the container registry. Possible values are Basic, Standard and Premium. Default = Basic"
  default     = "Basic"
}
variable "georeplications" {
  description = "only supported on new resources with the Premium SKU."
  default     = []
}
variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for the container registry"
  default     = true
}
variable "zone_redundancy_enabled" {
  type        = bool
  description = "Whether zone redundancy is enabled for this Container Registry? Changing this forces a new resource to be created"
  default     = false
}
variable "environment" {
  type        = string
  description = "The environment denotation.d=Development, t=Test, a=Acceptance, p=Production, dt=Dev-Test, ap=Acceptance-Production"
  default     = "d"
}
variable "zone" {
  type        = string
  description = "Enter abbreviation for Zone. e=External, i=Internal, m=Management"
  default     = ""
}
variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}
variable "registry_uai_name" {
  type = string
}
variable "aks_principal_id" {
  type = string
}