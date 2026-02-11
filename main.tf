resource "azurerm_data_factory_integration_runtime_azure_ssis" "data_factory_integration_runtime_azure_ssises" {
  for_each = var.data_factory_integration_runtime_azure_ssises

  data_factory_id                  = each.value.data_factory_id
  location                         = each.value.location
  name                             = each.value.name
  node_size                        = each.value.node_size
  credential_name                  = each.value.credential_name
  description                      = each.value.description
  edition                          = each.value.edition
  license_type                     = each.value.license_type
  max_parallel_executions_per_node = each.value.max_parallel_executions_per_node
  number_of_nodes                  = each.value.number_of_nodes

  dynamic "catalog_info" {
    for_each = each.value.catalog_info != null ? [each.value.catalog_info] : []
    content {
      administrator_login    = catalog_info.value.administrator_login
      administrator_password = catalog_info.value.administrator_password
      dual_standby_pair_name = catalog_info.value.dual_standby_pair_name
      elastic_pool_name      = catalog_info.value.elastic_pool_name
      pricing_tier           = catalog_info.value.pricing_tier
      server_endpoint        = catalog_info.value.server_endpoint
    }
  }

  dynamic "copy_compute_scale" {
    for_each = each.value.copy_compute_scale != null ? [each.value.copy_compute_scale] : []
    content {
      data_integration_unit = copy_compute_scale.value.data_integration_unit
      time_to_live          = copy_compute_scale.value.time_to_live
    }
  }

  dynamic "custom_setup_script" {
    for_each = each.value.custom_setup_script != null ? [each.value.custom_setup_script] : []
    content {
      blob_container_uri = custom_setup_script.value.blob_container_uri
      sas_token          = custom_setup_script.value.sas_token
    }
  }

  dynamic "express_custom_setup" {
    for_each = each.value.express_custom_setup != null ? [each.value.express_custom_setup] : []
    content {
      dynamic "command_key" {
        for_each = express_custom_setup.value.command_key != null ? [express_custom_setup.value.command_key] : []
        content {
          dynamic "key_vault_password" {
            for_each = command_key.value.key_vault_password != null ? [command_key.value.key_vault_password] : []
            content {
              linked_service_name = key_vault_password.value.linked_service_name
              parameters          = key_vault_password.value.parameters
              secret_name         = key_vault_password.value.secret_name
              secret_version      = key_vault_password.value.secret_version
            }
          }
          password    = command_key.value.password
          target_name = command_key.value.target_name
          user_name   = command_key.value.user_name
        }
      }
      dynamic "component" {
        for_each = express_custom_setup.value.component != null ? [express_custom_setup.value.component] : []
        content {
          dynamic "key_vault_license" {
            for_each = component.value.key_vault_license != null ? [component.value.key_vault_license] : []
            content {
              linked_service_name = key_vault_license.value.linked_service_name
              parameters          = key_vault_license.value.parameters
              secret_name         = key_vault_license.value.secret_name
              secret_version      = key_vault_license.value.secret_version
            }
          }
          license = component.value.license
          name    = component.value.name
        }
      }
      environment        = express_custom_setup.value.environment
      powershell_version = express_custom_setup.value.powershell_version
    }
  }

  dynamic "express_vnet_integration" {
    for_each = each.value.express_vnet_integration != null ? [each.value.express_vnet_integration] : []
    content {
      subnet_id = express_vnet_integration.value.subnet_id
    }
  }

  dynamic "package_store" {
    for_each = each.value.package_store != null ? [each.value.package_store] : []
    content {
      linked_service_name = package_store.value.linked_service_name
      name                = package_store.value.name
    }
  }

  dynamic "pipeline_external_compute_scale" {
    for_each = each.value.pipeline_external_compute_scale != null ? [each.value.pipeline_external_compute_scale] : []
    content {
      number_of_external_nodes = pipeline_external_compute_scale.value.number_of_external_nodes
      number_of_pipeline_nodes = pipeline_external_compute_scale.value.number_of_pipeline_nodes
      time_to_live             = pipeline_external_compute_scale.value.time_to_live
    }
  }

  dynamic "proxy" {
    for_each = each.value.proxy != null ? [each.value.proxy] : []
    content {
      path                                 = proxy.value.path
      self_hosted_integration_runtime_name = proxy.value.self_hosted_integration_runtime_name
      staging_storage_linked_service_name  = proxy.value.staging_storage_linked_service_name
    }
  }

  dynamic "vnet_integration" {
    for_each = each.value.vnet_integration != null ? [each.value.vnet_integration] : []
    content {
      public_ips  = vnet_integration.value.public_ips
      subnet_id   = vnet_integration.value.subnet_id
      subnet_name = vnet_integration.value.subnet_name
      vnet_id     = vnet_integration.value.vnet_id
    }
  }
}

