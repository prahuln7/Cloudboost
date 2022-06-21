variable "resource_group" {
  description = "Enter resource group for create action group and alert."
  type        = string
}
variable "applicationname" {
  description = "Name of the applicationname"
  type        = string
}
variable "environment" {
  description = "Name of the environment"
  type        = string
}
variable "name" {
  description = "Name of the Mariadb Server"
  type        = string
}
variable "sku_name" {
  description = "The sku-name parameter value follows the convention {pricing tier}_{compute generation}_{vCores} and --sku-name B_Gen5_2 maps to Basic, Gen 5, and 2 vCores."
  type        = string
  default     = "B_Gen5_2"
}
variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  type        = number
  default     = 51200
}
variable "mariadb_version" {
  description = "Specifies the version of MariaDB to use. Possible values are 10.2 and 10.3"
  type        = string
  default     = "10.2"
}
variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  type        = number
  default     = 10
}
variable "geo_redundant_backup_enabled" {
  description = "Turn Geo-redundant server backups on/off. Not available for the Basic tier."
  type        = bool
  default     = false
}
variable "administrator_login" {
  description = "MariaDB administrator login"
  type        = string
}
variable "administrator_password" {
  description = "MariaDB administrator password"
  type        = string
}
variable "ssl" {
  description = "Usage of SSL"
  type        = bool
  default     = true
}
variable "database_charset" {
  description = "Specifies the Charset for each MariaDB Database"
  type        = string
}
variable "database_collation" {
  description = "Specifies the Collation for each MariaDB Database"
  type        = string
}
variable "tags" {
  description = "Map of tags to add to create resources"
  type        = map(string)
  default     = {}
}
