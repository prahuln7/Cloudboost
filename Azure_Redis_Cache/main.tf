provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-redis_cache-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_redis_cache" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  tags                = var.tags
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  enable_non_ssl_port = var.enable_non_ssl_port
  minimum_tls_version = var.minimum_tls_version
  redis_configuration {
    enable_authentication           = var.enable_authentication
    maxmemory_reserved              = var.maxmemory_reserved
    maxmemory_delta                 = var.maxmemory_delta
    maxfragmentationmemory_reserved = var.maxfragmentationmemory_reserved
    maxmemory_policy                = var.maxmemory_policy
  }
}