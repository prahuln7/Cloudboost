provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-AS-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_availability_set" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  tags                = var.tags
}