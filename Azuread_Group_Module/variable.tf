variable "name" {
  type        = string
  description = "The display name for the group"
  default     = ""
}

variable "description" {
  type        = string
  description = "The description for the group."
  default     = "Active Directory Group"
}

variable "security_enabled" {
  type        = bool
  description = "Whether the group is a security group for controlling access to in-app resources. At least one of security_enabled or mail_enabled must be specified. A Microsoft 365 group can be security enabled and mail enabled (see the types property)."
  default     = false
}

variable "assignable_to_role" {
  type        = bool
  description = "Indicates whether this group can be assigned to an Azure Active Directory role. Can only be true for security-enabled groups. Changing this forces a new resource to be created."
  default     = false
}

variable "prevent_duplicate_names" {
  type        = bool
  description = "If true, will return an error if an existing group is found with the same name. Defaults to false."
  default     = true
}
