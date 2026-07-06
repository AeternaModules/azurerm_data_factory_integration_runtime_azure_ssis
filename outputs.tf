output "data_factory_integration_runtime_azure_ssises" {
  description = "All data_factory_integration_runtime_azure_ssis resources"
  value       = azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises
  sensitive   = true
}
output "data_factory_integration_runtime_azure_ssises_catalog_info" {
  description = "List of catalog_info values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.catalog_info]
  sensitive   = true
}
output "data_factory_integration_runtime_azure_ssises_copy_compute_scale" {
  description = "List of copy_compute_scale values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.copy_compute_scale]
}
output "data_factory_integration_runtime_azure_ssises_credential_name" {
  description = "List of credential_name values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.credential_name]
}
output "data_factory_integration_runtime_azure_ssises_custom_setup_script" {
  description = "List of custom_setup_script values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.custom_setup_script]
  sensitive   = true
}
output "data_factory_integration_runtime_azure_ssises_data_factory_id" {
  description = "List of data_factory_id values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.data_factory_id]
}
output "data_factory_integration_runtime_azure_ssises_description" {
  description = "List of description values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.description]
}
output "data_factory_integration_runtime_azure_ssises_edition" {
  description = "List of edition values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.edition]
}
output "data_factory_integration_runtime_azure_ssises_express_custom_setup" {
  description = "List of express_custom_setup values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.express_custom_setup]
  sensitive   = true
}
output "data_factory_integration_runtime_azure_ssises_express_vnet_integration" {
  description = "List of express_vnet_integration values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.express_vnet_integration]
}
output "data_factory_integration_runtime_azure_ssises_license_type" {
  description = "List of license_type values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.license_type]
}
output "data_factory_integration_runtime_azure_ssises_location" {
  description = "List of location values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.location]
}
output "data_factory_integration_runtime_azure_ssises_max_parallel_executions_per_node" {
  description = "List of max_parallel_executions_per_node values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.max_parallel_executions_per_node]
}
output "data_factory_integration_runtime_azure_ssises_name" {
  description = "List of name values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.name]
}
output "data_factory_integration_runtime_azure_ssises_node_size" {
  description = "List of node_size values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.node_size]
}
output "data_factory_integration_runtime_azure_ssises_number_of_nodes" {
  description = "List of number_of_nodes values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.number_of_nodes]
}
output "data_factory_integration_runtime_azure_ssises_package_store" {
  description = "List of package_store values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.package_store]
}
output "data_factory_integration_runtime_azure_ssises_pipeline_external_compute_scale" {
  description = "List of pipeline_external_compute_scale values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.pipeline_external_compute_scale]
}
output "data_factory_integration_runtime_azure_ssises_proxy" {
  description = "List of proxy values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.proxy]
}
output "data_factory_integration_runtime_azure_ssises_vnet_integration" {
  description = "List of vnet_integration values across all data_factory_integration_runtime_azure_ssises"
  value       = [for k, v in azurerm_data_factory_integration_runtime_azure_ssis.data_factory_integration_runtime_azure_ssises : v.vnet_integration]
}

