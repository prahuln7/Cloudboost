provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-rsv-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_recovery_services_vault" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  sku                 = var.recovery_vault_sku
  tags                = var.tags
}