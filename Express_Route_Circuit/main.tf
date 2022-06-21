provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-er-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_express_route_circuit" "circuit" {
  name                  = var.name == "" ? local.defaultname : var.name
  resource_group_name   = data.azurerm_resource_group.main.name
  location              = data.azurerm_resource_group.main.location
  tags                  = var.tags
  service_provider_name = var.provider_name
  peering_location      = var.peering_location
  bandwidth_in_mbps     = var.bandwidth_in_mbps
  sku {
    tier   = var.tier
    family = var.family
  }
}