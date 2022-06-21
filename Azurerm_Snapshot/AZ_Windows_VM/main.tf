provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-vm-${var.applicationname}-${var.environment}" : ""
}
resource "azurerm_virtual_machine" "main" {
  count                 = var.create_lmsvm ? 1 : 0
  name                  = var.name == "" ? local.defaultname : var.name
  location              = data.azurerm_resource_group.main.location
  resource_group_name   = data.azurerm_resource_group.main.name
  network_interface_ids = [var.monitor_vm_nic_ip]
  vm_size               = var.vm_size
  storage_image_reference {
    offer     = var.i_offer
    publisher = var.i_publisher
    sku       = var.i_sku
    version   = var.i_version
  }
  storage_os_disk {
    name              = var.os_disk_name
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }
  storage_data_disk {
    name              = var.add_disk_name
    managed_disk_type = var.managed_disk_type
    create_option     = var.cr_option
    lun               = var.lun
    disk_size_gb      = var.add_disk_size
  }
  os_profile {
    computer_name  = var.computer_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_windows_config {
    provision_vm_agent = var.provision_vm_agent
  }
  tags = var.tags
}