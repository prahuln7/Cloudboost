variable "name" {
  description = "Name of the azurerm redis cache"
  type        = string
  default     = ""
}
variable "resource_group_name" {
  type        = string
  description = "Name of the Resource group to be created"
  default     = ""
}
variable "applicationname" {
  type        = string
  description = "name of the application required"
}
variable "environment" {
  type        = string
  description = "The environment denotation.d=Development, t=Test, a=Acceptance, p=Production, dt=Dev-Test, ap=Acceptance-Production"
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}
variable "minimum_tls_version" {
  type        = string
  description = "about tls version"
  default     = "1.2"
}
variable "enable_non_ssl_port" {
  type        = bool
  description = "status of the Enable non-SSL port"
  default     = false
}
variable "sku_name" {
  type        = string
  description = "Defines which tier to use. Valid options are Basic,Standard and premium"
  default     = "Standard"
}
variable "family" {
  type        = string
  description = "The SKU family/pricing group to use. Valid values are `C` (for `Basic/Standard` SKU family) and `P` (for `Premium`)"
  default     = "C"
}
variable "capacity" {
  type        = number
  description = "Specifies the Capacity / Throughput Units for a Standard SKU . Valid values range from 1-6"
  default     = 2
}
variable "enable_authentication" {
  type        = bool
  description = "enable_authentication of redis configuration"
  default     = true
}
variable "maxmemory_reserved" {
  type        = number
  description = "maxmemory_reserved of redis configuration"
  default     = 10
}
variable "maxmemory_delta" {
  type        = number
  description = "maxmemory_delta of redis configuration"
  default     = 2
}
variable "maxfragmentationmemory_reserved" {
  type        = number
  description = "maxfragmentationmemory_reserved of redis configuration"
  default     = 2
}
variable "maxmemory_policy" {
  type        = string
  description = "maxmemory_policy of redis configuration"
  default     = "allkeys-lru"
}