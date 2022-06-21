provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-sqldb-${var.applicationname}-${var.environment}" : ""
}
data "azurerm_storage_account" "main" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.main.name
}
resource "azurerm_sql_server" "sqlserver" {
  name                         = "${var.name == "" ? local.defaultname : var.name}sql-srvr"
  resource_group_name          = data.azurerm_resource_group.main.name
  location                     = data.azurerm_resource_group.main.location
  version                      = var.server_version
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_password
  tags                         = var.tags
}
resource "azurerm_sql_database" "sqldbb" {
  name                = "${var.name == "" ? local.defaultname : var.name}sql-dbd"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  server_name         = azurerm_sql_server.sqlserver.name
  extended_auditing_policy {
    storage_endpoint                        = data.azurerm_storage_account.main.primary_blob_endpoint
    storage_account_access_key              = data.azurerm_storage_account.main.primary_access_key
    storage_account_access_key_is_secondary = var.storage_account_access_key_is_secondary
    retention_in_days                       = var.retention_in_days
  }
  tags = var.tags
}