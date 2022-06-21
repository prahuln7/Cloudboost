provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-mdisk-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_managed_disk" "main" {
  name                 = var.name == "" ? local.defaultname : var.name
  location             = data.azurerm_resource_group.main.location
  resource_group_name  = data.azurerm_resource_group.main.name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  tags                 = var.tags
}
