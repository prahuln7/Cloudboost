provider "azurerm" {
  features {}
}
data "azurerm_subscription" "current" {}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-secrcent-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_log_analytics_workspace" "security" {
  name                = var.name == "" ? local.defaultname : var.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  retention_in_days   = var.retention_in_days
  sku                 = var.log_analytics_sku
  tags                = var.tags
}
resource "azurerm_security_center_subscription_pricing" "security" {
  count         = length(var.resource_type)
  tier          = var.security_tier
  resource_type = var.resource_type[count.index]
}
resource "azurerm_security_center_workspace" "security" {
  scope        = data.azurerm_subscription.current.id
  workspace_id = azurerm_log_analytics_workspace.security.id
}
resource "azurerm_security_center_auto_provisioning" "autoprovision" {
  auto_provision = var.security_center_auto_provisioning
}
resource "azurerm_security_center_contact" "main" {
  email               = lookup(var.security_center_contacts, "email")
  phone               = lookup(var.security_center_contacts, "phone", null)
  alert_notifications = lookup(var.security_center_contacts, "alert_notifications", true)
  alerts_to_admins    = lookup(var.security_center_contacts, "alerts_to_admins", true)
}
resource "azurerm_security_center_setting" "main" {
  count        = var.enable_security_center_setting ? 1 : 0
  setting_name = var.security_center_setting_name
  enabled      = var.enable_security_center_setting
}

