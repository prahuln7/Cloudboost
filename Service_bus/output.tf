output "primary_connection_string" {
  value = azurerm_servicebus_queue_authorization_rule.servicebusqueueauthrule.primary_connection_string
}
