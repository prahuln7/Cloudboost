#---------------------------------------------------------------------
# This module deploys DNS A record using cloudboost best practices.
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
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-dnsa-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_dns_a_record" "a_record" {
  name                = var.name == "" ? local.defaultname : var.name
  zone_name           = var.zone_name
  resource_group_name = data.azurerm_resource_group.main.name
  ttl                 = var.time_to_live
  records             = var.ipaddress
}
