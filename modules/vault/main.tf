resource "oci_kms_key" "kms_key" {
  for_each       = var.kms_key_map
  compartment_id = each.value.kms_key_compartment_id
  display_name   = each.value.kms_key_display_name
  key_shape {
    algorithm = each.value.kms_key_key_shape_algorithm
    length    = each.value.kms_key_key_shape_length
    curve_id  = each.value.kms_key_key_shape_curve_id
  }
  desired_state = each.value.kms_key_desired_state
  dynamic "external_key_reference" {
    for_each = each.value.is_kms_key_external_key_reference ? [1] : []
    content {
      external_key_id = each.value.kms_key_external_key_reference_external_key_id
    }
  }

  is_auto_rotation_enabled = each.value.is_kms_key_auto_rotation_enabled
  dynamic "auto_key_rotation_details" {
    for_each = each.value.is_kms_key_auto_rotation_enabled ? [1] : []
    content {
      last_rotation_message     = each.value.kms_key_auto_key_rotation_details_last_rotation_message
      last_rotation_status      = each.value.kms_key_auto_key_rotation_details_last_rotation_status
      rotation_interval_in_days = each.value.kms_key_auto_key_rotation_details_rotation_interval_in_days
      time_of_last_rotation     = each.value.kms_key_auto_key_rotation_details_time_of_last_rotation
      time_of_next_rotation     = each.value.kms_key_auto_key_rotation_details_time_of_next_rotation
      time_of_schedule_start    = each.value.kms_key_auto_key_rotation_details_time_of_schedule_start
    }
  }

  management_endpoint = oci_kms_vault.kms_vault.management_endpoint
  protection_mode     = each.value.kms_key_protection_mode
  dynamic "restore_from_file" {
    for_each = each.value.is_kms_key_restore_from_file ? [1] : []
    content {
      content_length                = each.value.kms_key_restore_from_file_content_length
      content_md5                   = each.value.kms_key_restore_from_file_content_md5
      restore_key_from_file_details = each.value.kms_key_restore_key_from_file_details
    }
  }

  dynamic "restore_from_object_store" {
    for_each = each.value.is_kms_key_restore_from_object_store ? [1] : []
    content {
      bucket      = each.value.kms_key_restore_from_object_store_bucket
      destination = each.value.kms_key_restore_from_object_store_destination
      namespace   = each.value.kms_key_restore_from_object_store_namespace
      object      = each.value.kms_key_restore_from_object_store_object
      uri         = each.value.kms_key_restore_from_object_store_uri
    }
  }
  restore_trigger  = each.value.kms_key_restore_trigger
  time_of_deletion = each.value.kms_key_time_of_deletion
  defined_tags     = each.value.kms_key_defined_tags
  freeform_tags    = each.value.kms_key_freeform_tags
}

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