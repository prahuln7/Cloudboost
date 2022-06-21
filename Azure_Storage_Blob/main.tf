provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-stblob-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_storage_blob" "main" {
  name                   = var.name == "" ? local.defaultname : var.name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = var.blob_type
  source                 = var.blob_source
} 