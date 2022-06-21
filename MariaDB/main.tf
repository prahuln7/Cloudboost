provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-mariadb-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_mariadb_server" "main" {
  name                         = "${var.name == "" ? local.defaultname : var.name}mariadb-srvr"
  location                     = data.azurerm_resource_group.main.location
  resource_group_name          = data.azurerm_resource_group.main.name
  sku_name                     = var.sku_name
  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password
  version                      = var.mariadb_version
  ssl_enforcement_enabled      = var.ssl
  tags                         = var.tags
}
resource "azurerm_mariadb_database" "main" {
  name                = "${var.name == "" ? local.defaultname : var.name}mariadb1"
  resource_group_name = data.azurerm_resource_group.main.name
  server_name         = azurerm_mariadb_server.main.name
  charset             = var.database_charset
  collation           = var.database_collation
}