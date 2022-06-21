provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-nic-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_network_interface" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  tags                = var.tags
  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = var.subnet_web_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}