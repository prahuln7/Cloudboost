output "azurerm_data_factory_id" {
  description = "The id of the data factory"
  value       = azurerm_data_factory.data_factory.id
}
output "azurerm_data_factory_pipeline_id" {
  description = "The id of the data factory pipeline"
  value       = azurerm_data_factory_pipeline.main.id
}
