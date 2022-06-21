variable "resource_group" {
  description = "Enter resource group for create action group and alert."
  type        = string
}
variable "applicationname" {
  type        = string
  description = "Name of the applicationname"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
variable "name" {
  description = "Name of the Action Group"
  type        = string
  default     = ""
}
variable "short_name" {
  description = "The short name of the action group. This will be used in SMS messages."
  type        = string
}
variable "alert_email_id" {
  description = "Please enter COE email id for service health alert action group"
  type        = string
}
variable "deployment_mode" {
  description = "type of deployemnt mode"
  type        = string
  default     = "Incremental"
}
variable "email_reciever_name" {
  description = "Name of the email receiver"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "Map of tags to add to create resources"
  default     = {}
}