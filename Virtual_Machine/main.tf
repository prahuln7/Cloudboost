#this is to create linux vm from image.
provider "azurerm"
  features {
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-vm-${var.applicationname}-${var.environment}" : ""
}
data "azurerm_image" "search" {
  name                = var.search_image_name
  resource_group_name = var.resource_group_image
}
resource "azurerm_virtual_machine" "vm" {
  name                  = var.name == "" ? local.defaultname : var.name
  resource_group_name   = data.azurerm_resource_group.main.name
  location              = data.azurerm_resource_group.main.location
  tags                  = var.tags
  network_interface_ids = [var.network_interface_ids]
  vm_size               = var.vm_size
  storage_image_reference {
    id = data.azurerm_image.search.id
  }
  storage_os_disk {
    name              = var.osdisk_name
    caching           = var.os_caching
    create_option     = var.os_create_option
    managed_disk_type = var.managed_disk_type
  }
  os_profile {
    computer_name  = var.computer_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
    ssh_keys {
      path     = "/home/rootadmin/.ssh/authorized_keys"
      key_data = file(var.ssh_public_key)
    }
  }
}