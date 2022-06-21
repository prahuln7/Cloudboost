#---------------------------------------------------------------------
# This module deploys a NAT_Gateway following cloudboost best practices.
#---------------------------------------------------------------------

provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-natgw-${var.applicationname}-${var.environment}" : ""
}
data "azurerm_public_ip" "public_ip" {
  name                = var.ipname
  resource_group_name = data.azurerm_resource_group.main.name
}
resource "azurerm_public_ip_prefix" "public_ip_prefix" {
  name                = "public-ip-prefix-${var.name == "" ? local.defaultname : var.name}"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  prefix_length       = var.prefix_length
}
resource "azurerm_nat_gateway" "gw" {
  name                  = var.name == "" ? local.defaultname : var.name
  location              = data.azurerm_resource_group.main.location
  resource_group_name   = data.azurerm_resource_group.main.name
  public_ip_address_ids = [data.azurerm_public_ip.public_ip.id]
  public_ip_prefix_ids  = [azurerm_public_ip_prefix.public_ip_prefix.id]
  sku_name              = var.sku_name
  tags                  = var.tags
}