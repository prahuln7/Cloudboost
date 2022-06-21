
# ----- create service bus
resource "azurerm_servicebus_subscription" "servicebustopicsub" {
  name                = var.service_bus_topic_subscriptionname
  resource_group_name = var.resource_group_name
  namespace_name      = var.service_bus_namespace
  topic_name          = var.service_bus_topicname
  max_delivery_count  = var.max_delivery_count
}
