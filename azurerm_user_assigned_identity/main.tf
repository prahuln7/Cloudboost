provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource-group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-user_assigned_identity-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_user_assigned_identity" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  tags                = var.tags
}
