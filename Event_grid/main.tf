
# ----- create event grid
resource "azurerm_eventgrid_topic" "eventgridtopic" {
  name                = var.event_grid_topicname
  location            = var.location
  resource_group_name = var.resource_group_name
}

