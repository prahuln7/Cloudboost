provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-vwan-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_virtual_wan" "main" {
  name                              = var.name == "" ? local.defaultname : var.name
  resource_group_name               = data.azurerm_resource_group.main.name
  location                          = data.azurerm_resource_group.main.location
  disable_vpn_encryption            = var.disable_vpn_encryption
  allow_branch_to_branch_traffic    = var.allow_branch_to_branch_traffic
  office365_local_breakout_category = var.office365_local_breakout_category
  type                              = var.type
  tags                              = var.tags
  lifecycle {
    create_before_destroy = true
  }
}
resource "azurerm_virtual_hub" "main" {
  count               = length(var.hub_names) != 0 ? length(var.hub_names) : 0
  name                = var.hub_names[count.index]
  location            = var.hub_locations[count.index]
  address_prefix      = var.address_prefixes[count.index]
  resource_group_name = var.resource_group_name
  virtual_wan_id      = azurerm_virtual_wan.main.id
  dynamic "route" {
    for_each = var.routes[count.index]
    content {
      address_prefixes    = route.value.address_prefixes
      next_hop_ip_address = route.value.next_hop_ip_address
    }
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = var.tags
  depends_on = [
    azurerm_virtual_wan.main
  ]
}