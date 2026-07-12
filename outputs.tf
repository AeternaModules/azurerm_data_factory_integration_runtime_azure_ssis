output "data_factory_integration_runtime_azure_ssises_catalog_info" {
  description = "Map of catalog_info values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.catalog_info }
  sensitive   = true
}
output "data_factory_integration_runtime_azure_ssises_copy_compute_scale" {
  description = "Map of copy_compute_scale values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.copy_compute_scale }
}
output "data_factory_integration_runtime_azure_ssises_credential_name" {
  description = "Map of credential_name values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.credential_name }
}
output "data_factory_integration_runtime_azure_ssises_custom_setup_script" {
  description = "Map of custom_setup_script values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.custom_setup_script }
  sensitive   = true
}
output "data_factory_integration_runtime_azure_ssises_data_factory_id" {
  description = "Map of data_factory_id values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.data_factory_id }
}
output "data_factory_integration_runtime_azure_ssises_description" {
  description = "Map of description values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.description }
}
output "data_factory_integration_runtime_azure_ssises_edition" {
  description = "Map of edition values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.edition }
}
output "data_factory_integration_runtime_azure_ssises_express_custom_setup" {
  description = "Map of express_custom_setup values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.express_custom_setup }
  sensitive   = true
}
output "data_factory_integration_runtime_azure_ssises_express_vnet_integration" {
  description = "Map of express_vnet_integration values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.express_vnet_integration }
}
output "data_factory_integration_runtime_azure_ssises_license_type" {
  description = "Map of license_type values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.license_type }
}
output "data_factory_integration_runtime_azure_ssises_location" {
  description = "Map of location values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.location }
}
output "data_factory_integration_runtime_azure_ssises_max_parallel_executions_per_node" {
  description = "Map of max_parallel_executions_per_node values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.max_parallel_executions_per_node }
}
output "data_factory_integration_runtime_azure_ssises_name" {
  description = "Map of name values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.name }
}
output "data_factory_integration_runtime_azure_ssises_node_size" {
  description = "Map of node_size values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.node_size }
}
output "data_factory_integration_runtime_azure_ssises_number_of_nodes" {
  description = "Map of number_of_nodes values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.number_of_nodes }
}
output "data_factory_integration_runtime_azure_ssises_package_store" {
  description = "Map of package_store values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.package_store }
}
output "data_factory_integration_runtime_azure_ssises_pipeline_external_compute_scale" {
  description = "Map of pipeline_external_compute_scale values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.pipeline_external_compute_scale }
}
output "data_factory_integration_runtime_azure_ssises_proxy" {
  description = "Map of proxy values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.proxy }
}
output "data_factory_integration_runtime_azure_ssises_vnet_integration" {
  description = "Map of vnet_integration values across all data_factory_integration_runtime_azure_ssises, keyed the same as var.data_factory_integration_runtime_azure_ssises"
  value       = { for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : k => v.vnet_integration }
}

