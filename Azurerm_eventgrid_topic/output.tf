output "eventgrid_topic_id" {
  value       = azurerm_eventgrid_topic.main.id
  description = "This is giving the Id of eventgrid topic in azure"
}