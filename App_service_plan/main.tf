#--- app service plan
resource "azurerm_app_service_plan" "serviceplan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location

  kind = var.kind

  sku {
    tier = var.skutier
    size = var.skusize
  }

  /* 
    sku {
    tier = "ElasticPremium"
    size = "EP1"
  }

  sku {
    tier = "Standard"
    size = "S1" 
    }  
  */
}
