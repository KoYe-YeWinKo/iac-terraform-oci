
# ============================================================================
# Vault Secret Variables
# ============================================================================

variable "vault_secret_map" {
  description = "Map of secret definitions keyed by arbitrary name. Each value is an object with the fields used by vault_secret.tf"
  type = map(object({
    vault_secret_compartment_id                                             = string
    vault_secret_key_id                                                     = string
    vault_secret_vault_id                                                   = string
    vault_secret_secret_name                                                = string
    vault_secret_defined_tags                                               = map(string)
    vault_secret_freeform_tags                                              = map(string)
    vault_secret_description                                                = string
    vault_secret_enable_auto_generation                                     = bool
    vault_secret_metadata                                                   = map(any)
    is_enable_vault_secret_replication_config                               = bool
    vault_secret_replication_config_replication_targets_target_key_id       = optional(string, null)
    vault_secret_replication_config_replication_targets_region              = optional(string, null)
    vault_secret_replication_config_replication_targets_target_vault_id     = optional(string, null)
    vault_secret_replication_config_is_write_forward_enabled                = optional(bool, null)
    is_enable_vault_secret_rotation_config                                  = bool
    vault_secret_rotation_config_target_system_details_target_system_type   = optional(string, null)
    vault_secret_rotation_config_target_system_details_adb_id               = optional(string, null)
    vault_secret_rotation_config_target_system_details_function_id          = optional(string, null)
    vault_secret_rotation_config_is_scheduled_rotation_enabled              = optional(bool, null)
    vault_secret_rotation_config_rotation_interval                          = optional(number, null)
    is_vault_secret_secret_content_defined                                  = bool
    vault_secret_secret_content_type                                        = optional(string, null)
    vault_secret_secret_content                                             = optional(any, null)
    vault_secret_secret_content_name                                        = optional(string, null)
    vault_secret_secret_content_stage                                       = optional(string, null)
    is_vault_secret_secret_generation_context_defined                       = bool
    vault_secret_secret_generation_context                                  = optional(any, null)
    vault_secret_secret_generation_type                                     = optional(string, null)
    vault_secret_secret_generation_passphrase_length                        = optional(number, null)
    vault_secret_secret_generation_template                                 = optional(string, null)
    is_vault_secret_secret_rules_defined                                    = bool
    vault_secret_secret_rules_is_enforced_on_deleted_secret_versions        = optional(bool, null)
    vault_secret_secret_rules_is_secret_content_retrieval_blocked_on_expiry = optional(bool, null)
    vault_secret_secret_rules_rule_type                                     = optional(string, null)
    vault_secret_secret_rules_secret_version_expiry_interval                = optional(string, null)
    vault_secret_secret_rules_time_of_absolute_expiry                       = optional(string, null)
  }))
  default = {}
}
