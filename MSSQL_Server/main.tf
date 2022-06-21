provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-mssqlsrv-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_mssql_server" "mssql" {
  name                         = var.name == "" ? local.defaultname : var.name
  resource_group_name          = data.azurerm_resource_group.main.name
  location                     = data.azurerm_resource_group.main.location
  version                      = var.server_version
  administrator_login          = var.mssql_admin_username
  administrator_login_password = var.mssql_password
  minimum_tls_version          = var.minimum_tls_version
  tags                         = var.tags
}