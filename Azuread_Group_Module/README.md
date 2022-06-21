---
layout: page
permalink: /Azure/Terraform/Modules/ADGroup/
title: Azure Active Directory Group Terraform module
icon: azure.png
description: Azure Active Directory Group Terraform module by Sogeti community.
status: Ready for Production
type: S05 Security
automation: TerraformModule
onlineTemplateReference: https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal
onlineServiceDescription: https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal
packageId: unknown
buildName: unknown
name: Azure Active Directory Group
title: Azure Active Directory Group Terraform module
tags:
- Azure Active Directory 
- Azure Landing zone
---

{%- include template_terraform.html -%}

## How to use

```javascript

module "azurerm_ad_group" {
    source      = "../modules/Azuread_Group_Module"
    name        = "my_admin_group"
    description = "Application Admin users group"
}

```