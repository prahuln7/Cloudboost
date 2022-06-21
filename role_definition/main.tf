#---------------------------------------------------------------------
# This module creates a azure role definition following cloudboost best practices.
#---------------------------------------------------------------------
provider "azurerm" {
  features {}
}
resource "azurerm_role_definition" "rd" {
  name        = var.name
  scope       = var.scope
  description = "This is a custom role for blob data read"
  permissions {
    data_actions = [var.action_name]
    not_actions  = []
  }
  assignable_scopes = [
    var.scope
  ]
}