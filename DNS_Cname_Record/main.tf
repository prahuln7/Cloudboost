provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name      = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-dnscnmr-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_dns_cname_record" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  zone_name           = var.zone_name
  resource_group_name = data.azurerm_resource_group.main.name
  ttl                 = var.ttl
  record              = var.record
  tags                = var.tags
}

