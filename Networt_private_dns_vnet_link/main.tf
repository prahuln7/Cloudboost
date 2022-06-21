
# ---- create private endpoint DNS zone vnet link

resource "azurerm_private_dns_zone_virtual_network_link" "zone_to_vnet_link" {
  name                  = var.private_endpoint_zone_to_vnet_link_name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = var.virtual_network_id
}
