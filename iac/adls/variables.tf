variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The Azure location where the resources will be created"
}

variable "storage_account_name" {
  description = "The name of the storage account"
}

variable "account_tier" {
  description = "The performance tier of the storage account"
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
  default     = "LRS"
}

variable "is_hns_enabled" {
  description = "Indicates if hierarchical namespace is enabled on the storage account"
  default     = true
}

variable "storage_container_name" {
  description = "The name of the storage container"
}

variable "container_access_type" {
  description = "The access type of the storage container"
  default     = "private"
}

variable "virtual_network_subnet_ids" {
  description = "The IDs of the subnets to associate with the storage account"
  type        = list(string)
}

variable "ip_rules" {
  description = "The IP addresses to allow access to the storage account"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to apply to the storage account"
  default     = {}
}

