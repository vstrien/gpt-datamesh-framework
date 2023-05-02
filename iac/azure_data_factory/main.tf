provider "azurerm" {
  features {}
}

resource "azurerm_data_factory" "example" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_data_factory_integration_runtime_azure" "example" {
  name                = var.integration_runtime_name
  data_factory_name   = azurerm_data_factory.example.name
  resource_group_name = azurerm_data_factory.example.resource_group_name

  compute_type                = "General"
  location                    = var.location
  node_size                   = var.integration_runtime_node_size
  number_of_nodes             = var.integration_runtime_number_of_nodes
  max_parallel_executions_per_node = var.integration_runtime_max_parallel_executions

  description = "Azure Data Factory Integration Runtime"

  tags = var.tags
}