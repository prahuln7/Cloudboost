output "sentinel_alert_rule_scheduled" {
  description = "sentinel alert rule scheduled id"
  value       = { for a, v in azurerm_sentinel_alert_rule_scheduled.alert : a => v.id }
}
