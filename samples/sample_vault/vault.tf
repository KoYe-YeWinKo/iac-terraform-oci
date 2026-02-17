module "vault" {
  source = "../../modules/vault"

  kms_vault_compartment_id               = var.kms_vault_compartment_id
  kms_vault_display_name                 = var.kms_vault_display_name
  kms_vault_type                         = var.kms_vault_type
  kms_vault_defined_tags                 = var.kms_vault_defined_tags
  kms_vault_freeform_tags                = var.kms_vault_freeform_tags
  is_kms_vault_external_key_manager      = var.is_kms_vault_external_key_manager
  is_kms_vault_restore_from_file         = var.is_kms_vault_restore_from_file
  is_kms_vault_restore_from_object_store = var.is_kms_vault_restore_from_object_store
  kms_vault_time_of_deletion             = var.kms_vault_time_of_deletion

  kms_key_compartment_id               = var.kms_key_compartment_id
  kms_key_display_name                 = var.kms_key_display_name
  is_kms_key_external_key_reference    = var.is_kms_key_external_key_reference
  is_kms_key_auto_rotation_enabled     = var.is_kms_key_auto_rotation_enabled
  is_kms_key_restore_from_file         = var.is_kms_key_restore_from_file
  is_kms_key_restore_from_object_store = var.is_kms_key_restore_from_object_store
  vault_secret_map                     = var.vault_secret_map
}