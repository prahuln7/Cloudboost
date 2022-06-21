provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-pudnsz-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_dns_zone" "main-public" {
  name                = var.name == "" ? local.defaultname : var.name
  resource_group_name = data.azurerm_resource_group.main.name
}
