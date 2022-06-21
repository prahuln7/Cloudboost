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
variable "name" {
  type        = string
  description = "Name of targeted service/VM to add to Azure Recovery Services"
  default     = ""
}
variable "resource_group_name" {
  type        = string
  description = "Name of the recovery services Azure resource group"
  default     = ""
}
variable "recovery_vault_sku" {
  type        = string
  description = "Sets the vault's SKU. Possible values include: Standard, RS0"
  default     = "Standard"
}
variable "backup_policy" {
  description = "Configures the backup policy frequency, time(s) to perform backup, and weekdays (optional)"
  type = object({
    frequency = string
    time      = string
  })
  default = {
    frequency = ""
    time      = ""
  }
}
variable "retention_daily" {
  description = "(Optional) Configures the daily retention policy. Required when backup frequency is Daily"
  type = object({
    count = number
  })
  default = {
    count = 7
  }
}
variable "vm_count" {
  type        = string
  description = "Number of recovery protected VMs to create"
  default     = ""
}
variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
  default     = ""
}
variable "tags" {
  type        = map(any)
  description = "A list of tags to be applied"
  default     = {}
}
