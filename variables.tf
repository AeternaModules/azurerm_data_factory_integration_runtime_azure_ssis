variable "data_factory_integration_runtime_azure_ssiss" {
  description = <<EOT
Map of data_factory_integration_runtime_azure_ssiss, attributes below
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
    edition                          = optional(string, "Standard")
    license_type                     = optional(string, "LicenseIncluded")
    max_parallel_executions_per_node = optional(number, 1)
    number_of_nodes                  = optional(number, 1)
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
}

