variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
  type        = string
}
variable "name" {
  description = "The name of the Action Group."
  type        = string
  default     = ""
}
variable "short_name" {
  description = "The short name of the action group. This will be used in SMS messages."
  type        = string
}
variable "enabled" {
  description = "Whether this action group is enabled. If an action group is not enabled, then none of its receivers will receive communications. Defaults to true."
  type        = bool
  default = true
}
variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
variable "emails" {
  description = "List of email receivers"
  type = list(object({
    name                    = string
    email_address           = string
    use_common_alert_schema = bool
  }))
  default = []
}
variable "webhooks" {
  description = "List of webhook receivers"
  type = list(object({
    name                    = string
    service_uri             = string
    use_common_alert_schema = bool
  }))
  default = []
}
variable "applicationname" {
  type        = string
  description = "Name of the applicationname"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}