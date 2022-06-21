provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
resource "azurerm_monitor_metric_alert" "main" {
  for_each            = var.metric_alerts
  name                = each.key
  resource_group_name = data.azurerm_resource_group.main.id
  scopes              = each.value.scopes
  description         = each.value.description
  criteria {
    metric_namespace = each.value.metric_namespace
    metric_name      = each.value.metric_name
    aggregation      = each.value.aggregation
    operator         = each.value.operator
    threshold        = each.value.threshold
  }
  action {
    action_group_id = var.actiongroup_id
  }
  tags = var.tags
}
