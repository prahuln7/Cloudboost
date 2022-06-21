
# ----- create service bus

resource "azurerm_servicebus_queue" "servicebusqueue" {
  name                = var.service_bus_queuename
  resource_group_name = var.resource_group_name
  namespace_name      = var.service_bus_namespace
  enable_partitioning = true
  requires_session    = var.requires_session
}

