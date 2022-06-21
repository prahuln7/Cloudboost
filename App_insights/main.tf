#--- app insights
resource "azurerm_application_insights" "appinsight" {
  name                = var.app_insight_name
  resource_group_name = var.resource_group_name
  location            = var.location
  application_type    = "web"

}
