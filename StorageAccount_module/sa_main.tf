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
  ## TODO : Add to lower
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}sa${local.namelist[1]}${local.namelist[2]}${local.namelist[3]}${var.index}" : ""
}

resource "azurerm_storage_account" "main" {
  name                = var.name == "" ? local.defaultname : var.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  lifecycle {
    prevent_destroy = true
  }


  tags = var.tags
}
