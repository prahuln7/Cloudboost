---
layout: page
permalink: /Azure/Terraform/Modules/PublicIP/
title: Azure PublicIP Terraform module
icon: azure.png
description: Azure PublicIP Terraform module by Sogeti community.
status: Ready for Production
type: S04 Connectivity
automation: TerraformModule
onlineTemplateReference: https://docs.microsoft.com/en-us/azure/virtual-network/ip-services/public-ip-addresses
onlineServiceDescription: https://docs.microsoft.com/en-us/azure/virtual-network/ip-services/public-ip-addresses
packageId: unknown
buildName: unknown
name: Azure PublicIP
title: Azure PublicIP Terraform module
tags:
- Azure PublicIP
- AKS Landing zone by Sogeti community
---

{%- include template_terraform.html -%}

## How to use

```javascript

module "firewall_public_ip" {
  source              = "../modules/PublicIP_module"
  name                = lower(join("-", [var.customer, "fwpip", var.applicationname_short, var.region, var.environment_short]))
  resource_group_name = module.azurerm_rg_transit.resource_group_name
  sku                 = var.firewall_pip_sku
  allocation_method   = var.firewall_pip_allocation_method
  tags                = local.tags
  depends_on          = [module.azurerm_rg_transit]
}

```