#----------------------------------------------------------------------
# This module deploys a PostgreSQL Database within a PostgreSQL Server
#----------------------------------------------------------------------
provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-dbpgsql-${var.applicationname}-${var.environment}" : ""
}
data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.resource_group_name
}
data "azurerm_key_vault_secret" "secret" {
  name         = var.postgres_admin_key
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
resource "azurerm_postgresql_server" "server" {
  name                         = var.name == "" ? local.defaultname : var.name
  location                     = data.azurerm_resource_group.main.location
  resource_group_name          = data.azurerm_resource_group.main.name
  sku_name                     = var.sku_name
  auto_grow_enabled            = var.auto_grow_enabled
  administrator_login          = var.administrator_login
  administrator_login_password = data.azurerm_key_vault_secret.secret.value
  version                      = var.server_version
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled
  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  tags                         = var.tags
}
resource "azurerm_postgresql_database" "db" {
  name                = var.dbname
  resource_group_name = data.azurerm_resource_group.main.name
  server_name         = azurerm_postgresql_server.server.name
  charset             = var.charset
  collation           = var.collation
}