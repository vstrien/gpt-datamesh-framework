variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The Azure location where the resources will be created"
}

variable "data_factory_name" {
  description = "The name of the Azure Data Factory"
}

variable "integration_runtime_name" {
  description = "The name of the Azure Data Factory Integration Runtime"
}

variable "integration_runtime_node_size" {
  description = "The node size of the Azure Data Factory Integration Runtime"
  default     = "Standard_D2_v3"
}

variable "integration_runtime_number_of_nodes" {
  description = "The number of nodes for the Azure Data Factory Integration Runtime"
  default     = 1
}

variable "integration_runtime_max_parallel_executions" {
  description = "The maximum parallel executions per node for the Azure Data Factory Integration Runtime"
  default     = 1
}

variable "tags" {
  description = "A map of tags to apply to the Azure Data Factory resources"
  default     = {}
}