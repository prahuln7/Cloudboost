variable "name" {
  description = "Name of the bastion Host to be created"
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group. When no bastion name is given than the resource group name must be in the Sogeti naming format."

}

variable "subnet_id" {
  type        = string
  description = "Azure bastion Host subnet ID"
}

variable "public_ip_address_id" {
  type        = string
  description = "Azure bastion Host public ip address ID"
}

variable "ip_name" {
  type        = string
  description = "Azure bastion Host ip configration name "
}

variable "applicationname" {
  type        = string
  description = "Azure bastion Host application name "
}

variable "environment" {
  type        = string
  description = "The environment of the system in the resource group, can be t(team - the environment the team can use) d(development), t(test), a(acceptance), p(production) or any other the team usess."

}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

