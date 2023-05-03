provider "azurerm" {
  features {}
}

resource "azurerm_sql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_sql_database" "example" {
  name                = var.sql_database_name
  resource_group_name = azurerm_sql_server.example.resource_group_name
  server_name         = azurerm_sql_server.example.name
  location            = azurerm_sql_server.example.location
  edition             = var.sql_database_edition
  requested_service_objective_name = var.sql_database_service_objective

  tags = var.tags
}

resource "azurerm_sql_server_firewall_rule" "example" {
  name                = "AllowAllWindowsAzureIps"
  resource_group_name = azurerm_sql_server.example.resource_group_name
  server_name         = azurerm_sql_server.example.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_sql_server_auditing" "example" {
  state = "Enabled"
  storage_account_access_key = var.storage_account_access_key
  storage_endpoint = var.storage_endpoint
  retention_days = var.retention_days
  server_id = azurerm_sql_server.example.id
}