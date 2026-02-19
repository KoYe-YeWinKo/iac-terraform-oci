resource "oci_vault_secret" "vault_secret" {
  for_each               = var.vault_secret_map
  compartment_id         = each.value.vault_secret_compartment_id
  key_id                 = each.value.vault_secret_key_id
  vault_id               = each.value.vault_secret_vault_id
  secret_name            = each.value.vault_secret_secret_name
  defined_tags           = each.value.vault_secret_defined_tags
  freeform_tags          = each.value.vault_secret_freeform_tags
  description            = each.value.vault_secret_description
  enable_auto_generation = each.value.vault_secret_enable_auto_generation
  metadata               = each.value.vault_secret_metadata

  dynamic "replication_config" {
    for_each = each.value.is_enable_vault_secret_replication_config ? [1] : []
    content {
      replication_targets {
        target_key_id   = each.value.vault_secret_replication_config_replication_targets_target_key_id
        target_region   = each.value.vault_secret_replication_config_replication_targets_region
        target_vault_id = each.value.vault_secret_replication_config_replication_targets_target_vault_id
      }
      is_write_forward_enabled = each.value.vault_secret_replication_config_is_write_forward_enabled
    }

  }
  dynamic "rotation_config" {
    for_each = each.value.is_enable_vault_secret_rotation_config ? [1] : []
    content {
      target_system_details {
        target_system_type = each.value.vault_secret_rotation_config_target_system_details_target_system_type
        adb_id             = each.value.vault_secret_rotation_config_target_system_details_adb_id
        function_id        = each.value.vault_secret_rotation_config_target_system_details_function_id
      }
      is_scheduled_rotation_enabled = each.value.vault_secret_rotation_config_is_scheduled_rotation_enabled
      rotation_interval             = each.value.vault_secret_rotation_config_rotation_interval
    }
  }

  dynamic "secret_content" {
    for_each = each.value.is_vault_secret_secret_content_defined ? [1] : []
    content {
      content_type = each.value.vault_secret_secret_content_type
      content      = each.value.vault_secret_secret_content
      name         = each.value.vault_secret_secret_content_name
      stage        = each.value.vault_secret_secret_content_stage
    }
  }

  dynamic "secret_generation_context" {
    for_each = each.value.is_vault_secret_secret_generation_context_defined ? [1] : []
    content {
      generation_template = each.value.vault_secret_secret_generation_context
      generation_type     = each.value.vault_secret_secret_generation_type
      passphrase_length   = each.value.vault_secret_secret_generation_passphrase_length
      secret_template     = each.value.vault_secret_secret_generation_template
    }
  }

  dynamic "secret_rules" {
    for_each = each.value.is_vault_secret_secret_rules_defined ? [1] : []
    content {
      is_enforced_on_deleted_secret_versions        = each.value.vault_secret_secret_rules_is_enforced_on_deleted_secret_versions
      is_secret_content_retrieval_blocked_on_expiry = each.value.vault_secret_secret_rules_is_secret_content_retrieval_blocked_on_expiry
      rule_type                                     = each.value.vault_secret_secret_rules_rule_type
      secret_version_expiry_interval                = each.value.vault_secret_secret_rules_secret_version_expiry_interval
      time_of_absolute_expiry                       = each.value.vault_secret_secret_rules_time_of_absolute_expiry
    }
  }
}