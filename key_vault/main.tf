
# ---- create azure key vault for current client configuration

resource "azurerm_key_vault" "keyvlt" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id //data.azurerm_client_config.current.tenant_id

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
  sku_name = var.sku
}
