
output "instrumentation_key" {
  value = azurerm_application_insights.appinsight.instrumentation_key
}

output "appi_connection_string" {
  value = azurerm_application_insights.appinsight.connection_string
}
