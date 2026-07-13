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
    edition                          = optional(string)
    license_type                     = optional(string)
    max_parallel_executions_per_node = optional(number)
    number_of_nodes                  = optional(number)
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
      command_key = optional(list(object({
        key_vault_password = optional(object({
          linked_service_name = string
          parameters          = optional(map(string))
          secret_name         = string
          secret_version      = optional(string)
        }))
        password    = optional(string)
        target_name = string
        user_name   = string
      })))
      component = optional(list(object({
        key_vault_license = optional(object({
          linked_service_name = string
          parameters          = optional(map(string))
          secret_name         = string
          secret_version      = optional(string)
        }))
        license = optional(string)
        name    = string
      })))
      environment        = optional(map(string))
      powershell_version = optional(string)
    }))
    express_vnet_integration = optional(object({
      subnet_id = string
    }))
    package_store = optional(list(object({
      linked_service_name = string
      name                = string
    })))
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
        v.copy_compute_scale == null || (v.copy_compute_scale.data_integration_unit == null || ((v.copy_compute_scale.data_integration_unit >= 4 && v.copy_compute_scale.data_integration_unit <= 256) && ((v.copy_compute_scale.data_integration_unit % 4) == 0)))
      )
    ])
    error_message = "all of: must be between 4 and 256; must be divisible by 4"
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
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || alltrue([for item in v.express_custom_setup.command_key : (length(item.target_name) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || alltrue([for item in v.express_custom_setup.command_key : (length(item.user_name) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || alltrue([for item in v.express_custom_setup.command_key : (item.password == null || (length(item.password) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || alltrue([for item in v.express_custom_setup.command_key : (item.key_vault_password == null || (length(item.key_vault_password.linked_service_name) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || alltrue([for item in v.express_custom_setup.command_key : (item.key_vault_password == null || (length(item.key_vault_password.secret_name) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.command_key == null || alltrue([for item in v.express_custom_setup.command_key : (item.key_vault_password == null || (item.key_vault_password.secret_version == null || (length(item.key_vault_password.secret_version) > 0)))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.component == null || alltrue([for item in v.express_custom_setup.component : (length(item.name) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.component == null || alltrue([for item in v.express_custom_setup.component : (item.license == null || (length(item.license) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.component == null || alltrue([for item in v.express_custom_setup.component : (item.key_vault_license == null || (length(item.key_vault_license.linked_service_name) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.component == null || alltrue([for item in v.express_custom_setup.component : (item.key_vault_license == null || (length(item.key_vault_license.secret_name) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.express_custom_setup == null || (v.express_custom_setup.component == null || alltrue([for item in v.express_custom_setup.component : (item.key_vault_license == null || (item.key_vault_license.secret_version == null || (length(item.key_vault_license.secret_version) > 0)))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.package_store == null || alltrue([for item in v.package_store : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factory_integration_runtime_azure_ssises : (
        v.package_store == null || alltrue([for item in v.package_store : (length(item.linked_service_name) > 0)])
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
  # Note: 14 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

