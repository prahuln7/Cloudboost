variable "environment" {
  description = "Name of the target environment"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the Resource group"
  type        = string
}
variable "name" {
  description = "Specifies the name of the PostgreSQL Server."
  type        = string
}
variable "sku_name" {
  description = "Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
  type        = string
  default     = "B_Gen5_2"
}
variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  type        = number
  default     = 5120
}
variable "auto_grow_enabled" {
  description = "Whether the amount of provisioned storage will automatically grow as it is exhausted"
  type        = bool
  default     = true
}
variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  type        = number
  default     = 7
}
variable "geo_redundant_backup_enabled" {
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are true or false, not supported for the basic tier."
  type        = bool
  default     = false
}
variable "server_version" {
  description = "Specifies the version of PostgreSQL to use. Valid values are 9.5, 9.6, and 10.0. Changing this forces a new resource to be created."
  type        = string
  default     = 9.6
}
variable "ssl_enforcement_enabled" {
  description = "Specifies if SSL should be enforced on connections. Possible values are true and false."
  type        = bool
  default     = true
}
variable "administrator_login" {
  description = "The Administrator Login for the PostgreSQL Server."
  type        = string
}
variable "postgres_admin_key" {
  description = "The Azure KeyVault secret key associated with the administrator_login for the PostgreSQL Server."
  type        = string
}
variable "keyvault_name" {
  description = "The Name of the Azure Key Vault where postgres secrets are stored."
  type        = string
}
variable "tags" {
  description = "Map of tags to add all network components"
  type        = map(any)
  default     = {}
}
variable "applicationname" {
  description = "Name of the applicationname"
  type        = string
}
variable "dbname" {
  description = "Name of the Database"
  type        = string
}
variable "charset" {
  description = "Specifies the Charset for the PostgreSQL Database, which needs to be a valid PostgreSQL Charset"
  type        = string
  default     = "UTF8"
}
variable "collation" {
  description = "Specifies the Collation for the PostgreSQL Database, which needs to be a valid PostgreSQL Collation"
  type        = string
  default     = "English_United States.1252"
}