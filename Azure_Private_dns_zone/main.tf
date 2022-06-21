provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name     = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-pdnsz-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_private_dns_zone" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  resource_group_name = data.azurerm_resource_group.main.name
  tags                = var.tags
}
