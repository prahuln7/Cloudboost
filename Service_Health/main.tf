provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "main" {
  name = var.resource_group
}

locals {
  namelist       = split("-", data.azurerm_resource_group.main.name)
  namevalidation = length(local.namelist) == 4 ? "true" : "false"
  defaultname    = local.namevalidation == "true" ? "${local.namelist[0]}-servheal-${var.applicationname}-${var.environment}" : ""
}

resource "azurerm_monitor_action_group" "main" {
  name                = "${var.name == "" ? local.defaultname : var.name}Service Health Monitoring Action Group"
  resource_group_name = data.azurerm_resource_group.main.name
  short_name          = var.short_name
  email_receiver {
    name          = var.email_reciever_name
    email_address = var.alert_email_id
  }
  tags = var.tags
}

resource "azurerm_template_deployment" "template_deployment" {
  name                = "${var.name == "" ? local.defaultname : var.name}service-health"
  resource_group_name = var.resource_group
  deployment_mode     = var.deployment_mode
  template_body       = <<DEPLOY
{
   "$schema":"https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
   "contentVersion":"1.0.0.0",
   "parameters":{
      "activityLogAlertName":{
         "type":"string",
         "defaultValue":"Service Health Alert ${var.environment}"
      },
      "actionGroupResourceId":{
         "type":"string",
         "defaultValue":"${azurerm_monitor_action_group.main.id}"
      },
      "ServiceHealthRegions":{
         "type":"array",
         "defaultValue":[
            "South Central US",
            "North Central US"
         ]
      },
      "ServiceHealthServices":{
         "type":"array",
         "defaultValue":[
            "Automation",
            "Azure Active Directory",
            "Virtual Machine Scale Sets",
            "Azure Kubernetes Service (AKS)",
            "Azure Database for PostgreSQL",
            "Application Insights",
            "Alerts",
            "Azure Container Registry",
            "Key Vault",
            "Log Analytics",
            "Storage"
         ]
      }
   },
   "resources":[
      {
         "type":"Microsoft.Insights/activityLogAlerts",
         "apiVersion":"2017-04-01",
         "name":"[parameters('activityLogAlertName')]",
         "location":"Global",
         "kind":null,
         "tags":{
         },
         "properties":{
            "mode":"Incremental",
            "enabled":true,
            "description":"",
            "scopes":[
               "[subscription().id]"
            ],
            "condition":{
               "allOf":[
                  {
                     "field":"category",
                     "equals":"ServiceHealth",
                     "containsAny":null
                  },
                  {
                     "field":"properties.incidentType",
                     "equals":"Informational",
                     "containsAny":null
                  },
                  {
                     "field":"properties.incidentType",
                     "equals":"Maintenance",
                     "containsAny":null
                  },
                  {
                     "field":"properties.incidentType",
                     "equals":"Incident",
                     "containsAny":null
                  },
                  {
                     "field":"properties.incidentType",
                     "equals":"ActionRequired",
                     "containsAny":null
                  },
                  {
                     "field":"properties.incidentType",
                     "equals":"Security",
                     "containsAny":null
                  },
                  {
                     "field":"properties.impactedServices[*].ImpactedRegions[*].RegionName",
                     "equals":null,
                     "containsAny":"[parameters('ServiceHealthRegions')]"
                  },
                  {
                     "field":"properties.impactedServices[*].ServiceName",
                     "equals":null,
                     "containsAny":"[parameters('ServiceHealthServices')]"
                  }
               ]
            },
            "actions":{
               "actionGroups":[
                  {
                     "actionGroupId":"[parameters('actionGroupResourceId')]",
                     "webhookProperties":{

                     }
                  }
               ]
            }
         }
      }
   ]
}
DEPLOY
}
