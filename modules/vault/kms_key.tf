resource "oci_kms_key" "kms_key" {
  compartment_id = var.kms_key_compartment_id
  display_name   = var.kms_key_display_name
  key_shape {
    algorithm = var.kms_key_key_shape_algorithm
    length    = var.kms_key_key_shape_length
    curve_id  = var.kms_key_key_shape_curve_id
  }
  desired_state = var.kms_key_desired_state
  dynamic "external_key_reference" {
    for_each = var.is_kms_key_external_key_reference ? [1] : []
    content {
      external_key_id = var.kms_key_external_key_reference_external_key_id
    }
  }

  is_auto_rotation_enabled = var.is_kms_key_auto_rotation_enabled
  dynamic "auto_key_rotation_details" {
    for_each = var.is_kms_key_auto_rotation_enabled ? [1] : []
    content {
      last_rotation_message     = var.kms_key_auto_key_rotation_details_last_rotation_message
      last_rotation_status      = var.kms_key_auto_key_rotation_details_last_rotation_status
      rotation_interval_in_days = var.kms_key_auto_key_rotation_details_rotation_interval_in_days
      time_of_last_rotation     = var.kms_key_auto_key_rotation_details_time_of_last_rotation
      time_of_next_rotation     = var.kms_key_auto_key_rotation_details_time_of_next_rotation
      time_of_schedule_start    = var.kms_key_auto_key_rotation_details_time_of_schedule_start
    }
  }

  management_endpoint = oci_kms_vault.kms_vault.management_endpoint
  protection_mode     = var.kms_key_protection_mode
  dynamic "restore_from_file" {
    for_each = var.is_kms_key_restore_from_file ? [1] : []
    content {
      content_length                = var.kms_key_restore_from_file_content_length
      content_md5                   = var.kms_key_restore_from_file_content_md5
      restore_key_from_file_details = var.kms_key_restore_key_from_file_details
    }
  }

  dynamic "restore_from_object_store" {
    for_each = var.is_kms_key_restore_from_object_store ? [1] : []
    content {
      bucket      = var.kms_key_restore_from_object_store_bucket
      destination = var.kms_key_restore_from_object_store_destination
      namespace   = var.kms_key_restore_from_object_store_namespace
      object      = var.kms_key_restore_from_object_store_object
      uri         = var.kms_key_restore_from_object_store_uri
    }
  }
  restore_trigger  = var.kms_key_restore_trigger
  time_of_deletion = var.kms_key_time_of_deletion
  defined_tags     = var.kms_key_defined_tags
  freeform_tags    = var.kms_key_freeform_tags
}