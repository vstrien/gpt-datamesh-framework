variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The Azure location where the resources will be created"
}

variable "sql_server_name" {
  description = "The name of the Azure SQL Server"
}

variable "sql_server_version" {
  description = "The version of the Azure SQL Server"
  default     = "12.0"
}

variable "administrator_login" {
  description = "The login name for the Azure SQL Server administrator"
}

variable "administrator_login_password" {
  description = "The password for the Azure SQL Server administrator"
}

variable "sql_database_name" {
  description = "The name of the Azure SQL Database"
}

variable "sql_database_edition" {
  description = "The edition of the Azure SQL Database"
  default     = "Standard"
}

variable "sql_database_service_objective" {
  description = "The service tier objective for the Azure SQL Database"
  default     = "S0"
}

variable "tags" {
  description = "A map of tags to apply to the Azure SQL resources"
  default     = {}
}

variable "storage_account_access_key" {
  description = "The access key for the storage account"
}

variable "storage_endpoint" {
  description = "The storage endpoint for the storage account"
}

variable "retention_days" {
  description = "The retention days for the storage account"
  default     = 30
}