variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
  type        = string
}
variable "location" {
  description = "The Azure Region in which to create resource."
  type        = string
}
variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
variable "resource_id" {
  description = "The resource id of the resource which is being monitored."
  type        = string
}
variable "actiongroup_id" {
  description = "The id of the action group for which this alert is being configured"
  type        = string
}
variable "activity_log_alerts" {
  description = "Map of acivity log alerts"
  type = map(object({
    scopes            = list(string)
    description       = string
    criteria_category = string
  }))
  default = null
}
variable "applicationname" {
  type        = string
  description = "Name of the applicationname"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
