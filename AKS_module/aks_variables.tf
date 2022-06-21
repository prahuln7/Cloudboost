variable "name" {
  type        = string
  description = "The name of the AKS Cluster. When the variable name is left empty, than the resource group name must be in the Sogeti naming format. The name must contain between 3 and 31 characters inclusive. The name can contain only letters, numbers, and hyphens. The name must start with a letter and must end with a letter or a number."
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group for the Key Vault.  When the variable name is left empty, than the resource group name must be in the Sogeti naming format."
}
variable "kubernetes_version" {
  type    = string
  default = ""
}
variable "private_cluster_enabled" {
  type    = bool
  default = false
}
variable "sku_tier" {
  type    = string
  default = "Free"
}
variable "api_auth_ips" {
  description = "Whitelist of IP addresses that are allowed to access the AKS Master Control Plane API"
  type        = list(string)
}
variable "admin_username" {
  type = string
}
variable "public_ssh_key" {
  type = string
}
variable "network_policy" {
  type = string
}
variable "network_plugin" {
  type = string
}
variable "enable_rbac" {
  type    = bool
  default = true
}
variable "is_rbac_managed" {
  type    = bool
  default = true
}
variable "client_id" {
  type        = string
  description = "The client ID of an existing service principal."
}
variable "client_secret" {
  type        = string
  description = "The client secret of an existing service principal."
}
variable "workspace_id" {
  type = string
}
variable "gateway_id" {
  type = string
}
variable "aci_connector_linux_subnet_name" {
  type = string
}
variable "subnet_aks_id" {
  type = string
}
variable "addons" {
  description = "Defines which addons will be activated."
  type = object({
    enable_aci                      = bool
    enable_http_application_routing = bool
    oms_agent                       = bool
    kubernetes_dashboard            = bool
    azure_policy                    = bool
    gateway_enabled                 = bool
  })
}

variable "system_node_pool" {
  type = object({
    node_count                     = number
    vm_size                        = string
    max_pods                       = number
    os_disk_size_gb                = number
    zones                          = list(string)
    labels                         = map(string)
    taints                         = list(string)
    cluster_node_public_ip         = bool
    cluster_auto_scaling           = bool
    cluster_auto_scaling_min_count = number
    cluster_auto_scaling_max_count = number
    cluster_host_encryption        = bool
  })
}

variable "additional_node_pools" {
  type = map(object({
    node_count                     = number
    vm_size                        = string
    os_disk_size_gb                = number
    max_pods                       = number
    zones                          = list(string)
    labels                         = map(string)
    taints                         = list(string)
    node_os                        = string
    cluster_auto_scaling           = bool
    cluster_auto_scaling_min_count = number
    cluster_auto_scaling_max_count = number
    cluster_host_encryption        = bool
  }))
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}
