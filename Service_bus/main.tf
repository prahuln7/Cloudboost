
# ----- create service bus
resource "azurerm_servicebus_namespace" "servicebusns" {
  name                = var.service_bus_namespace
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Premium"
  capacity            = 1
}

resource "azurerm_servicebus_queue" "servicebusqueue" {
  name                = var.service_bus_queuename
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.servicebusns.name
  enable_partitioning = true
}

resource "azurerm_servicebus_queue_authorization_rule" "servicebusqueueauthrule" {
  name                = var.service_bus_queue_namespace_rule
  namespace_name      = azurerm_servicebus_namespace.servicebusns.name
  queue_name          = azurerm_servicebus_queue.servicebusqueue.name
  resource_group_name = var.resource_group_name

  listen = true
  send   = true
  manage = false
}

resource "azurerm_servicebus_topic" "servicebustopic" {
  name                = var.service_bus_topicname
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.servicebusns.name
  enable_partitioning = true
}

