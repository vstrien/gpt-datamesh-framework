provider "azurerm" {
  features {}
}

# Create a databricks workspace with system assigned managed identity

resource "azurerm_databricks_workspace" "example" {
  name                        = var.databricks_workspace_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = var.databricks_sku
  managed_resource_group_name = var.managed_resource_group_name

  # Set system assigned managed identity
  identity {
    type = "SystemAssigned"
  }

  custom_parameters {
    no_public_ip = var.no_public_ip
  }

  tags = var.tags
}

