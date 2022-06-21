variable "name" {
  description = "This is a custom role name"
  type        = string
}
variable "scope" {
  description = "The scope at which role defnition applies to"
  type        = string
}
variable "action_name" {
  description = "list of allowed actions"
  type        = string
}