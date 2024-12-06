variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
 }

variable "location" {
  description = "Azure region"
  type        = string
    default     = "uksouth"
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
