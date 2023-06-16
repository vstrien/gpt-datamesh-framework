provider "azurerm" {
  features {}
}

# Create a databricks workspace with system assigned managed identity

resource "azurerm_databricks_workspace" "example" {
  name                        = var.databricks_workspace_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = var.databricks_sku
 

  tags = var.tags
}

