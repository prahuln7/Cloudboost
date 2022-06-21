---
layout: page
permalink: /Azure/Terraform/windows_function_app/
icon: Azure Function_COLOR.png
description: Windows Function App by the Sogeti community
status: Ready for Production
type: S07 Compute
automation: TerraformModule
onlineTemplateReference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app
onlineServiceDescription: https://docs.microsoft.com/en-us/azure/azure-functions/functions-overview
packageId: unknown
buildName: unknown
name: Windows Function App with Terraform
title: Windows Function App with Terraform
tags:
- Azure Windows Function App
---

{%- include template_terraform.html -%}
```terraform
module "azurerm_windows_function_app" {
    name                = "test-windows-function-app"
    os_type             = "Windows"
    site_config {
    always_on = "false"
    }
}
```