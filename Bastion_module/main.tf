provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-basion-${var.applicationname}-${var.environment}" : ""
}

resource "azurerm_bastion_host" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  tags                = var.tags

  ip_configuration {
    name                 = var.ip_name
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }
}