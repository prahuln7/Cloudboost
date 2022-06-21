output "monitor_activity_log_alert" {
  description = "Id of the action group alert."
  value       = { for a, v in azurerm_monitor_activity_log_alert.main : a => v.id }
}