resource "azuread_group" "main" {
  display_name            = var.name
  description             = var.description
  security_enabled        = var.security_enabled
  prevent_duplicate_names = var.prevent_duplicate_names
  assignable_to_role      = var.assignable_to_role
}
