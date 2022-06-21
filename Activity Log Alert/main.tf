provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-lalt-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_monitor_activity_log_alert" "main" {
  for_each            = var.activity_log_alerts
  name                = each.key
  resource_group_name = data.azurerm_resource_group.main.name
  scopes              = each.value.scopes
  description         = each.value.description
  criteria {
    category    = each.value.criteria_category
    resource_id = var.resource_id
    service_health {
      locations = [var.location]
    }
  }
  action {
    action_group_id = var.actiongroup_id
  }
  tags = var.tags
}