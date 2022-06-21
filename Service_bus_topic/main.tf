
# ----- create service bus

resource "azurerm_servicebus_topic" "servicebustopic" {
  name                = var.service_bus_topicname
  resource_group_name = var.resource_group_name
  namespace_name      = var.service_bus_namespace
  enable_partitioning = true
}

