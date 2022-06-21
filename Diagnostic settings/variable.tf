variable "name" {
  description = "Name of Diagnostic settings"
  type        = string
  default     = ""
}
variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"
  type        = string
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
variable "destination" {
  description = "Destination for events, either Event Hub, Log Analytics or a Storage account"
  type        = string
  default     = ""
}
variable "storage_account_id" {
  description = "stroage account has been created "
  type        = string
  default     = ""
}
variable "target_ids" {
  description = "List of resource ids to create diagnostic settings for."
  type        = list(string)
}
variable "eventhub_name" {
  description = "Event Hub name if destination is an event hub."
  type        = string
  default     = ""
}
variable "logs" {
  description = "List of log categories to log."
  type        = list(string)
  default     = ["AuditEvent"]
}
variable "metrics" {
  description = "List of metric categories to track."
  type        = list(string)
  default     = []
}
variable "retention_days" {
  description = "about_retention_days"
  type        = number
  default     = 365
}
variable "retention_policy_log_enable" {
  description = "This is about retention policy for logs"
  type        = bool
  default     = true
}
variable "retention_policy_metrics_enable" {
  description = "This is about retention policy for metrics"
  type        = bool
  default     = false
}