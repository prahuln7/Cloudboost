terraform {
  required_version = "0.12.6"
}

provider "azurerm" {
  version = "1.32.0"
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

locals {
  namelist    = split("-", data.azurerm_resource_group.main.name)
  namevalidation     = "${length(local.namelist) == 4 ? "true" : "false"}"
  defaultname =  "${local.namevalidation == "true" ? ${local.namelist[0]}kv${local.namelist[1]}${local.namelist[2]}${local.namelist[3]} : ""}"
}

data "azurerm_client_config" "main" {}

resource "azurerm_key_vault" "main" {
  name                = "${var.name == "" ? local.defaultname : var.name}"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  tenant_id           = data.azurerm_client_config.main.tenant_id

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  sku_name = var.sku

  tags = var.tags
}
