variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
variable "applicationname" {
  type        = string
  description = "Name of the application"
}
variable "name" {
  type        = string
  description = "The name of the DNS A record"
}
variable "ipaddress" {
  description = "ipaddress of the domain"
  type        = list(string)
}
variable "time_to_live" {
  description = "Time to live in secs"
  type        = number
}
variable "zone_name" {
  description = "Name of the DNS zone"
  type        = string

}