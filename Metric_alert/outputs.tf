output "alert_id" {
  description = "Id of the action group alert."
  value       = { for a, v in azurerm_monitor_metric_alert.main : a => v.id }
}