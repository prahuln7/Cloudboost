
variable "cosmosdb_sqlcontainer_name" {
  description = "Name of the cosmos db sqldatabase container"
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"
}

variable "cosmosdb_account_name" {
  description = "Name of the cosmos db account"
}

variable "cosmosdb_sqldatabase_name" {
  description = "Name of the cosmos db sqldatabase"
}

variable "partition_key_path" {
  description = "partition key path of db container"
}

variable "throughput_policy_max_throughput" {
  description = "throughput policy max throughput"
}

variable "index_policy_included_paths" {
  description = "index policy included paths"
  type = list(object({
    path = string
  }))
}

variable "index_policy_excluded_paths" {
  description = "index policy excludedpaths"
  type = list(object({
    path = string
  }))
}

variable "setting_time_to_live" {
  description = "setting time to live"
}

