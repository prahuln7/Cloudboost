terraform {
  required_version = "0.12.6"
}

provider "azurerm" {
  version = "1.32.0"
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"

  ## TODO: Make conform Sogeti Cloud Reference Architecure
  defaultname = local.namevalidation == "true" ? "${local.namelist[0]}nsg${local.namelist[1]}${local.namelist[2]}${local.namelist[3]}" : ""
}

resource "azurerm_network_security_group" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  tags                = var.tags
}
