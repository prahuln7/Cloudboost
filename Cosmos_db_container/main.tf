
# ---- create cosmos db sql database container

resource "azurerm_cosmosdb_sql_container" "cosmosdbsqlcontainer" {
  name                = var.cosmosdb_sqlcontainer_name
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  database_name       = var.cosmosdb_sqldatabase_name
  partition_key_path  = var.partition_key_path
  throughput          = var.throughput_policy_max_throughput

  indexing_policy {
    indexing_mode = "Consistent"

    dynamic "included_path" {
      for_each = var.index_policy_included_paths
      content {
        path = included_path.value.path
      }
    }

    dynamic "excluded_path" {
      for_each = var.index_policy_excluded_paths
      content {
        path = excluded_path.value.path
      }
    }
  }

  default_ttl = var.setting_time_to_live
}
