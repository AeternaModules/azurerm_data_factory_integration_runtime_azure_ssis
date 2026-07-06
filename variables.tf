variable "data_factory_integration_runtime_azure_ssises" {
  description = <<EOT
Map of data_factory_integration_runtime_azure_ssises, attributes below
Required:
    - data_factory_id
    - location
    - name
    - node_size
Optional:
    - credential_name
    - description
    - edition
    - license_type
    - max_parallel_executions_per_node
    - number_of_nodes
    - catalog_info (block):
        - administrator_login (optional)
        - administrator_password (optional)
        - dual_standby_pair_name (optional)
        - elastic_pool_name (optional)
        - pricing_tier (optional)
        - server_endpoint (required)
    - copy_compute_scale (block):
        - data_integration_unit (optional)
        - time_to_live (optional)
    - custom_setup_script (block):
        - blob_container_uri (required)
        - sas_token (required)
    - express_custom_setup (block):
        - command_key (optional, block):
            - key_vault_password (optional, block):
                - linked_service_name (required)
                - parameters (optional)
                - secret_name (required)
                - secret_version (optional)
            - password (optional)
            - target_name (required)
            - user_name (required)
        - component (optional, block):
            - key_vault_license (optional, block):
                - linked_service_name (required)
                - parameters (optional)
                - secret_name (required)
                - secret_version (optional)
            - license (optional)
            - name (required)
        - environment (optional)
        - powershell_version (optional)
    - express_vnet_integration (block):
        - subnet_id (required)
    - package_store (block):
        - linked_service_name (required)
        - name (required)
    - pipeline_external_compute_scale (block):
        - number_of_external_nodes (optional)
        - number_of_pipeline_nodes (optional)
        - time_to_live (optional)
    - proxy (block):
        - path (optional)
        - self_hosted_integration_runtime_name (required)
        - staging_storage_linked_service_name (required)
    - vnet_integration (block):
        - public_ips (optional)
        - subnet_id (optional)
        - subnet_name (optional)
        - vnet_id (optional)
EOT

  type = map(object({
    data_factory_id                  = string
    location                         = string
    name                             = string
    node_size                        = string
    credential_name                  = optional(string)
    description                      = optional(string)
    edition                          = optional(string) # Default: "Standard"
    license_type                     = optional(string) # Default: "LicenseIncluded"
    max_parallel_executions_per_node = optional(number) # Default: 1
    number_of_nodes                  = optional(number) # Default: 1
    catalog_info = optional(object({
      administrator_login    = optional(string)
      administrator_password = optional(string)
      dual_standby_pair_name = optional(string)
      elastic_pool_name      = optional(string)
      pricing_tier           = optional(string)
      server_endpoint        = string
    }))
    copy_compute_scale = optional(object({
      data_integration_unit = optional(number)
      time_to_live          = optional(number)
    }))
    custom_setup_script = optional(object({
      blob_container_uri = string
      sas_token          = string
    }))
    express_custom_setup = optional(object({
      command_key = optional(object({
        key_vault_password = optional(object({
          linked_service_name = string
          parameters          = optional(map(string))
          secret_name         = string
          secret_version      = optional(string)
        }))
        password    = optional(string)
        target_name = string
        user_name   = string
      }))
      component = optional(object({
        key_vault_license = optional(object({
          linked_service_name = string
          parameters          = optional(map(string))
          secret_name         = string
          secret_version      = optional(string)
        }))
        license = optional(string)
        name    = string
      }))
      environment        = optional(map(string))
      powershell_version = optional(string)
    }))
    express_vnet_integration = optional(object({
      subnet_id = string
    }))
    package_store = optional(object({
      linked_service_name = string
      name                = string
    }))
    pipeline_external_compute_scale = optional(object({
      number_of_external_nodes = optional(number)
      number_of_pipeline_nodes = optional(number)
      time_to_live             = optional(number)
    }))
    proxy = optional(object({
      path                                 = optional(string)
      self_hosted_integration_runtime_name = string
      staging_storage_linked_service_name  = string
    }))
    vnet_integration = optional(object({
      public_ips  = optional(list(string))
      subnet_id   = optional(string)
      subnet_name = optional(string)
      vnet_id     = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        can(regex("^([a-zA-Z0-9](-|-?[a-zA-Z0-9]+)+[a-zA-Z0-9])$", v.name))
      )
    ])
    error_message = "Invalid name for Managed Integration Runtime: minimum 3 characters, must start and end with a number or a letter, may only consist of letters, numbers and dashes and no consecutive dashes."
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        contains(["Standard_D2_v3", "Standard_D4_v3", "Standard_D8_v3", "Standard_D16_v3", "Standard_D32_v3", "Standard_D64_v3", "Standard_E2_v3", "Standard_E4_v3", "Standard_E8_v3", "Standard_E16_v3", "Standard_E32_v3", "Standard_E64_v3", "Standard_D1_v2", "Standard_D2_v2", "Standard_D3_v2", "Standard_D4_v2", "Standard_A4_v2", "Standard_A8_v2"], v.node_size)
      )
    ])
    error_message = "must be one of: Standard_D2_v3, Standard_D4_v3, Standard_D8_v3, Standard_D16_v3, Standard_D32_v3, Standard_D64_v3, Standard_E2_v3, Standard_E4_v3, Standard_E8_v3, Standard_E16_v3, Standard_E32_v3, Standard_E64_v3, Standard_D1_v2, Standard_D2_v2, Standard_D3_v2, Standard_D4_v2, Standard_A4_v2, Standard_A8_v2"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.number_of_nodes == null || (v.number_of_nodes >= 1 && v.number_of_nodes <= 10)
      )
    ])
    error_message = "must be between 1 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.max_parallel_executions_per_node == null || (v.max_parallel_executions_per_node >= 1 && v.max_parallel_executions_per_node <= 16)
      )
    ])
    error_message = "must be between 1 and 16"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.credential_name == null || (length(v.credential_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.copy_compute_scale == null || (v.copy_compute_scale.time_to_live == null || (v.copy_compute_scale.time_to_live >= 5))
      )
    ])
    error_message = "must be at least 5"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.vnet_integration == null || (v.vnet_integration.subnet_name == null || (length(v.vnet_integration.subnet_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.custom_setup_script == null || (length(v.custom_setup_script.blob_container_uri) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.custom_setup_script == null || (length(v.custom_setup_script.sas_token) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.catalog_info == null || (length(v.catalog_info.server_endpoint) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.catalog_info == null || (v.catalog_info.administrator_login == null || (length(v.catalog_info.administrator_login) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.catalog_info == null || (v.catalog_info.administrator_password == null || (length(v.catalog_info.administrator_password) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.catalog_info == null || (v.catalog_info.pricing_tier == null || (contains(["Basic", "S0", "S1", "S2", "S3", "S4", "S6", "S7", "S9", "S12", "P1", "P2", "P4", "P6", "P11", "P15", "GP_S_Gen5_1", "GP_S_Gen5_2", "GP_S_Gen5_4", "GP_S_Gen5_6", "GP_S_Gen5_8", "GP_S_Gen5_10", "GP_S_Gen5_12", "GP_S_Gen5_14", "GP_S_Gen5_16", "GP_S_Gen5_18", "GP_S_Gen5_20", "GP_S_Gen5_24", "GP_S_Gen5_32", "GP_S_Gen5_40", "GP_Gen5_2", "GP_Gen5_4", "GP_Gen5_6", "GP_Gen5_8", "GP_Gen5_10", "GP_Gen5_12", "GP_Gen5_14", "GP_Gen5_16", "GP_Gen5_18", "GP_Gen5_20", "GP_Gen5_24", "GP_Gen5_32", "GP_Gen5_40", "GP_Gen5_80", "BC_Gen5_2", "BC_Gen5_4", "BC_Gen5_6", "BC_Gen5_8", "BC_Gen5_10", "BC_Gen5_12", "BC_Gen5_14", "BC_Gen5_16", "BC_Gen5_18", "BC_Gen5_20", "BC_Gen5_24", "BC_Gen5_32", "BC_Gen5_40", "BC_Gen5_80", "HS_Gen5_2", "HS_Gen5_4", "HS_Gen5_6", "HS_Gen5_8", "HS_Gen5_10", "HS_Gen5_12", "HS_Gen5_14", "HS_Gen5_16", "HS_Gen5_18", "HS_Gen5_20", "HS_Gen5_24", "HS_Gen5_32", "HS_Gen5_40", "HS_Gen5_80"], v.catalog_info.pricing_tier)))
      )
    ])
    error_message = "must be one of: Basic, S0, S1, S2, S3, S4, S6, S7, S9, S12, P1, P2, P4, P6, P11, P15, GP_S_Gen5_1, GP_S_Gen5_2, GP_S_Gen5_4, GP_S_Gen5_6, GP_S_Gen5_8, GP_S_Gen5_10, GP_S_Gen5_12, GP_S_Gen5_14, GP_S_Gen5_16, GP_S_Gen5_18, GP_S_Gen5_20, GP_S_Gen5_24, GP_S_Gen5_32, GP_S_Gen5_40, GP_Gen5_2, GP_Gen5_4, GP_Gen5_6, GP_Gen5_8, GP_Gen5_10, GP_Gen5_12, GP_Gen5_14, GP_Gen5_16, GP_Gen5_18, GP_Gen5_20, GP_Gen5_24, GP_Gen5_32, GP_Gen5_40, GP_Gen5_80, BC_Gen5_2, BC_Gen5_4, BC_Gen5_6, BC_Gen5_8, BC_Gen5_10, BC_Gen5_12, BC_Gen5_14, BC_Gen5_16, BC_Gen5_18, BC_Gen5_20, BC_Gen5_24, BC_Gen5_32, BC_Gen5_40, BC_Gen5_80, HS_Gen5_2, HS_Gen5_4, HS_Gen5_6, HS_Gen5_8, HS_Gen5_10, HS_Gen5_12, HS_Gen5_14, HS_Gen5_16, HS_Gen5_18, HS_Gen5_20, HS_Gen5_24, HS_Gen5_32, HS_Gen5_40, HS_Gen5_80"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.catalog_info == null || (v.catalog_info.dual_standby_pair_name == null || (length(v.catalog_info.dual_standby_pair_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.powershell_version == null || (length(v.express_custom_setup.powershell_version) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || (length(v.express_custom_setup.command_key.target_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || (length(v.express_custom_setup.command_key.user_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || (v.express_custom_setup.command_key.password == null || (length(v.express_custom_setup.command_key.password) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || (v.express_custom_setup.command_key.key_vault_password == null || (length(v.express_custom_setup.command_key.key_vault_password.linked_service_name) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || (v.express_custom_setup.command_key.key_vault_password == null || (length(v.express_custom_setup.command_key.key_vault_password.secret_name) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || (v.express_custom_setup.command_key.key_vault_password == null || (v.express_custom_setup.command_key.key_vault_password.secret_version == null || (length(v.express_custom_setup.command_key.key_vault_password.secret_version) > 0))))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.component == null || (length(v.express_custom_setup.component.name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.component == null || (v.express_custom_setup.component.license == null || (length(v.express_custom_setup.component.license) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.component == null || (v.express_custom_setup.component.key_vault_license == null || (length(v.express_custom_setup.component.key_vault_license.linked_service_name) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.component == null || (v.express_custom_setup.component.key_vault_license == null || (length(v.express_custom_setup.component.key_vault_license.secret_name) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.component == null || (v.express_custom_setup.component.key_vault_license == null || (v.express_custom_setup.component.key_vault_license.secret_version == null || (length(v.express_custom_setup.component.key_vault_license.secret_version) > 0))))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.package_store == null || (length(v.package_store.name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.package_store == null || (length(v.package_store.linked_service_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.pipeline_external_compute_scale == null || (v.pipeline_external_compute_scale.number_of_external_nodes == null || (v.pipeline_external_compute_scale.number_of_external_nodes >= 1 && v.pipeline_external_compute_scale.number_of_external_nodes <= 10))
      )
    ])
    error_message = "must be between 1 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.pipeline_external_compute_scale == null || (v.pipeline_external_compute_scale.number_of_pipeline_nodes == null || (v.pipeline_external_compute_scale.number_of_pipeline_nodes >= 1 && v.pipeline_external_compute_scale.number_of_pipeline_nodes <= 10))
      )
    ])
    error_message = "must be between 1 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.pipeline_external_compute_scale == null || (v.pipeline_external_compute_scale.time_to_live == null || (v.pipeline_external_compute_scale.time_to_live >= 5))
      )
    ])
    error_message = "must be at least 5"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.proxy == null || (length(v.proxy.self_hosted_integration_runtime_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.proxy == null || (length(v.proxy.staging_storage_linked_service_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.proxy == null || (v.proxy.path == null || (length(v.proxy.path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_data_factory_integration_runtime_azure_ssis's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: data_factory_id
  #   source:    [from factories.ValidateFactoryID] !ok
  # path: data_factory_id
  #   source:    [from factories.ValidateFactoryID] err != nil
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: edition
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: copy_compute_scale.data_integration_unit
  #   source:    validation.All(...) - no translation rule yet, add one
  # path: express_vnet_integration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: express_vnet_integration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: license_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: vnet_integration.vnet_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: vnet_integration.vnet_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: vnet_integration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: vnet_integration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: vnet_integration.public_ips[*]
  #   source:    [from commonids.ValidatePublicIPAddressID] !ok
  # path: vnet_integration.public_ips[*]
  #   source:    [from commonids.ValidatePublicIPAddressID] err != nil
  # path: catalog_info.elastic_pool_name
  #   source:    sqlValidate.ValidateMsSqlElasticPoolName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
}

