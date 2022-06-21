
# ---- create 
#--- function app 
resource "azurerm_function_app" "funcapp" {
  name                       = var.function_app_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.primary_access_key
  version                    = var.function_verion

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"           = var.instrumentation_key
    "WEBSITE_CONTENTSHARE"                     = "{var.function_app_name}-content"
    "WEBSITE_CONTENTAZUREFILECONNECTIONSTRING" = var.primary_access_key
  }
}
