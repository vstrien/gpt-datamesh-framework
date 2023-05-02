provider "azurerm" {
  features {}
}

resource "azurerm_databricks_workspace" "example" {
  name                        = var.databricks_workspace_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = var.databricks_sku
  managed_resource_group_name = var.managed_resource_group_name

  custom_parameters {
    no_public_ip = var.no_public_ip
  }

  tags = var.tags
}