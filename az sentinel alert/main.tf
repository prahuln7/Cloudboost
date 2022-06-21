provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
resource "azurerm_sentinel_alert_rule_scheduled" "alert" {
  log_analytics_workspace_id = var.log_analytics_workspace_id
  for_each = var.sentinel_rule
  name         = each.key
  description  = each.value.description
  display_name = each.value.display_name
  severity     = each.value.severity
  query        = each.value.query
}
