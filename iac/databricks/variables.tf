variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The Azure location where the resources will be created"
}

variable "databricks_workspace_name" {
  description = "The name of the Databricks workspace"
}

variable "databricks_sku" {
  description = "The SKU of the Databricks workspace"
  default     = "standard"
}

variable "tags" {
  description = "A map of tags to apply to the Databricks workspace"
  default     = {}
}