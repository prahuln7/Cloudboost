provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-rp-${var.applicationname}-${var.environment}" : ""
}
data "azurerm_resource_group" "group" {
  for_each = var.resource_groups
  name     = each.value
}
resource "azurerm_management_lock" "main" {
  for_each   = data.azurerm_resource_group.group
  name       = "${each.key}-lock"
  scope      = each.value.id
  lock_level = var.lock_level
}