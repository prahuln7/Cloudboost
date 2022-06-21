provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-snap-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_snapshot" "main" {
  name = var.name == "" ? local.defaultname : var.name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  create_option       = var.create_option
  source_uri          = var.source_uri
  tags                = var.tags
}