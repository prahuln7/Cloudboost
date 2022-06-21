provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-wfa-${var.application_name}-${var.environment}" : ""
}
data "azurerm_storage_account" "main" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.main.name
}
resource "azurerm_service_plan" "main" {
  name                = "${var.name == "" ? local.defaultname : var.name}windows-service-plan-test"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}
resource "azurerm_windows_function_app" "main" {
  name                       = "${var.name == "" ? local.defaultname : var.name}windows-function-app"
  resource_group_name        = data.azurerm_resource_group.main.name
  location                   = data.azurerm_resource_group.main.location
  service_plan_id            = azurerm_service_plan.main.id
  storage_account_name       = data.azurerm_storage_account.main.name
  storage_account_access_key = data.azurerm_storage_account.main.primary_access_key
  site_config {
    always_on = var.always_on
  }
}