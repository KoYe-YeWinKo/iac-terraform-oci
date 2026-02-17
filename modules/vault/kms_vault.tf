resource "oci_kms_vault" "kms_vault" {
  compartment_id = var.kms_vault_compartment_id
  display_name   = var.kms_vault_display_name
  vault_type     = var.kms_vault_type
  defined_tags   = var.kms_vault_defined_tags
  dynamic "external_key_manager_metadata" {
    for_each = var.is_kms_vault_external_key_manager ? [1] : []
    content {
      external_vault_endpoint_url = var.kms_vault_external_key_manager_metadata_external_vault_endpoint_url
      oauth_metadata {
        client_app_id         = var.kms_vault_external_key_manager_metadata_oauth_metadata_client_app_id
        client_app_secret     = var.kms_vault_external_key_manager_metadata_oauth_metadata_clientapp_secret
        idcs_account_name_url = var.kms_vault_external_key_manager_metadata_oauth_metadata_idcs_account_name_url
      }
      private_endpoint_id = var.kms_vault_external_key_manager_metadata_private_endpoint_id
    }
  }
  freeform_tags = var.kms_vault_freeform_tags
  dynamic "restore_from_file" {
    for_each = var.is_kms_vault_restore_from_file ? [1] : []
    content {
      content_length                  = var.kms_vault_restore_from_file_content_length
      content_md5                     = var.kms_vault_restore_from_file_content_md5
      restore_vault_from_file_details = var.kms_vault_restore_from_file_restore_vault_from_file_details
    }
  }

  dynamic "restore_from_object_store" {
    for_each = var.is_kms_vault_restore_from_object_store ? [1] : []
    content {
      bucket      = var.kms_vault_restore_from_object_store_bucket
      destination = var.kms_vault_restore_from_object_store_destination
      namespace   = var.kms_vault_restore_from_object_store_namespace
      object      = var.kms_vault_restore_from_object_store_object
      uri         = var.kms_vault_restore_from_object_store_uri
    }
  }
  time_of_deletion = var.kms_vault_time_of_deletion
}