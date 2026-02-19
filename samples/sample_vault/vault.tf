module "vault" {
  source = "../../modules/vault"

  kms_vault_compartment_id                                                     = var.kms_vault_compartment_id
  kms_vault_display_name                                                       = var.kms_vault_display_name
  kms_vault_type                                                               = var.kms_vault_type
  kms_vault_defined_tags                                                       = var.kms_vault_defined_tags
  kms_vault_freeform_tags                                                      = var.kms_vault_freeform_tags
  is_kms_vault_external_key_manager                                            = var.is_kms_vault_external_key_manager
  is_kms_vault_restore_from_file                                               = var.is_kms_vault_restore_from_file
  is_kms_vault_restore_from_object_store                                       = var.is_kms_vault_restore_from_object_store
  kms_vault_time_of_deletion                                                   = var.kms_vault_time_of_deletion
  kms_vault_external_key_manager_metadata_external_vault_endpoint_url          = var.kms_vault_external_key_manager_metadata_external_vault_endpoint_url
  kms_vault_external_key_manager_metadata_oauth_metadata_client_app_id         = var.kms_vault_external_key_manager_metadata_oauth_metadata_client_app_id
  kms_vault_external_key_manager_metadata_oauth_metadata_clientapp_secret      = var.kms_vault_external_key_manager_metadata_oauth_metadata_clientapp_secret
  kms_vault_external_key_manager_metadata_oauth_metadata_idcs_account_name_url = var.kms_vault_external_key_manager_metadata_oauth_metadata_idcs_account_name_url
  kms_vault_external_key_manager_metadata_private_endpoint_id                  = var.kms_vault_external_key_manager_metadata_private_endpoint_id
  kms_key_map                                                                  = var.kms_key_map
}