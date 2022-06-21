provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-lb-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_lb" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  sku                 = var.sku
  tags                = var.tags
  frontend_ip_configuration {
    name                          = var.frontend_ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address            = var.private_ip_allocation == "Static" ? var.private_ip_address : ""
    private_ip_address_allocation = var.private_ip_allocation
    public_ip_address_id          = var.public_ip_address_id
  }
}
resource "azurerm_lb_backend_address_pool" "main" {
  name            = var.lb_backend_name
  loadbalancer_id = azurerm_lb.main.id
}