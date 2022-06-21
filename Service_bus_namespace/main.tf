
# ----- create service bus
resource "azurerm_servicebus_namespace" "servicebusns" {
  name                = var.service_bus_namespace
  location            = var.location
  resource_group_name = var.resource_group_name
  #sku                 = "Standard"
  sku      = "Premium"
  capacity = 1
}
