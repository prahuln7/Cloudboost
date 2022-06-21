provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-df-${var.application_name}-${var.environment}" : ""
}
resource "azurerm_data_factory" "data_factory" {
  name                = var.name == "" ? local.defaultname : var.name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  tags                = var.tags
  public_network_enabled = false
}
resource "azurerm_data_factory_pipeline" "main" {
  name                = "${var.name == "" ? local.defaultname : var.name}-pipeline"
  resource_group_name = data.azurerm_resource_group.main.name
  data_factory_id     = azurerm_data_factory.data_factory.id
}
