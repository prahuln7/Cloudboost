variable "resource_group_name" {
  type        = string
  description = "resource group name as per cloud boost naming coneventions"
}
variable "environment" {
  type        = string
  description = "Name of target environment"
}
variable "applicationname" {
  type        = string
  description = "applicationname requierd"
}
variable "log_analytics_workspace_id" {
  description = "Provide the log analytics workspace id"
  type        = string
}

variable "sentinel_rule" {
  description = "Sentinal rule"
  type = map(object({
    description  = string
    display_name = string
    severity     = string
    query        = string
  }))
  default = {}
}
