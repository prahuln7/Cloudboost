# ---- create private endpoint dns zone


resource "azurerm_private_dns_zone" "plink_dns_private_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
}   