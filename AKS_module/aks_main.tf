
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-aks-${local.namelist[1]}-${local.namelist[2]}-${local.namelist[3]}" : ""
}

resource "azurerm_kubernetes_cluster" "main" {
  name                    = var.name == "" ? local.defaultname : var.name
  dns_prefix              = "${var.name == "" ? local.defaultname : var.name}-dns"
  location                = data.azurerm_resource_group.main.location
  resource_group_name     = data.azurerm_resource_group.main.name
  kubernetes_version      = var.kubernetes_version
  private_cluster_enabled = var.private_cluster_enabled
  sku_tier                = var.sku_tier
  # automatic_channel_upgrade       = "stable"
  api_server_authorized_ip_ranges = var.api_auth_ips

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = file(var.public_ssh_key)
    }
  }

  role_based_access_control {
    enabled = var.enable_rbac

    azure_active_directory {
      managed = var.is_rbac_managed
    }
  }

  identity {
    type = "SystemAssigned"
  }

  /* service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  } */

  network_profile {
    # Using azure-cni for advanced networking
    network_plugin = var.network_plugin
    # The network policy to be used with Azure CNI.
    network_policy    = var.network_policy
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
  }

  addon_profile {
    aci_connector_linux {
      enabled     = var.addons.enable_aci
      subnet_name = var.aci_connector_linux_subnet_name
    }
    azure_policy {
      enabled = var.addons.azure_policy
    }
    http_application_routing {
      enabled = var.addons.enable_http_application_routing
    }
    kube_dashboard {
      enabled = var.addons.kubernetes_dashboard
    }
    oms_agent {
      enabled                    = var.addons.oms_agent
      log_analytics_workspace_id = var.workspace_id
    }
    ingress_application_gateway {
      enabled    = var.addons.gateway_enabled
      gateway_id = var.gateway_id
    }
  }

  #create system node pool
  default_node_pool {
    name                   = "akssyspool"
    orchestrator_version   = var.kubernetes_version
    node_count             = var.system_node_pool.node_count
    vm_size                = var.system_node_pool.vm_size
    type                   = "VirtualMachineScaleSets"
    availability_zones     = var.system_node_pool.zones
    max_pods               = var.system_node_pool.max_pods
    os_disk_size_gb        = var.system_node_pool.os_disk_size_gb
    node_labels            = var.system_node_pool.labels
    enable_node_public_ip  = var.system_node_pool.cluster_node_public_ip
    enable_auto_scaling    = var.system_node_pool.cluster_auto_scaling
    max_count              = var.system_node_pool.cluster_auto_scaling_max_count
    min_count              = var.system_node_pool.cluster_auto_scaling_min_count
    enable_host_encryption = var.system_node_pool.cluster_host_encryption
    vnet_subnet_id         = var.subnet_aks_id
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "main" {

  for_each = var.additional_node_pools

  name                   = each.value.node_os == "Linux" ? substr(each.key, 0, 6) : substr(each.key, 0, 12)
  kubernetes_cluster_id  = azurerm_kubernetes_cluster.main.id
  orchestrator_version   = var.kubernetes_version
  mode                   = "User"
  node_count             = each.value.node_count
  vm_size                = each.value.vm_size
  os_disk_size_gb        = each.value.os_disk_size_gb
  node_labels            = each.value.labels
  availability_zones     = each.value.zones
  enable_auto_scaling    = each.value.cluster_auto_scaling
  os_type                = each.value.node_os
  min_count              = each.value.cluster_auto_scaling_min_count
  max_count              = each.value.cluster_auto_scaling_max_count
  max_pods               = each.value.max_pods
  enable_host_encryption = each.value.cluster_host_encryption
  node_taints            = each.value.taints
  vnet_subnet_id         = var.subnet_aks_id

  tags = var.tags
}
