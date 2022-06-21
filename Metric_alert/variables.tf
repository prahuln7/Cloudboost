variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
  type        = string
}
variable "enabled" {
  description = "Whether this action group is enabled. If an action group is not enabled, then none of its receivers will receive communications. Defaults to true."
  type        = bool
  default     = true
}
variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
variable "actiongroup_id" {
  description = "The id of the action group for which this alert is being configured"
  type        = string
}
variable "metric_alerts" {
  description = "Map of acivity log alerts"
  type = map(object({
    scopes           = list(string)
    description      = string
    metric_namespace = string
    metric_name      = string
    aggregation      = string
    operator         = string
    threshold        = number
  }))
}