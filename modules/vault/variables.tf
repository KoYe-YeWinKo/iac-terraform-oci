variable "kms_vault_compartment_id" {
  description = "The OCID of the compartment where the KMS vault will be created"
  type        = string
}

variable "kms_vault_display_name" {
  description = "A user-friendly name for the KMS vault"
  type        = string
}

variable "kms_vault_type" {
  description = "The type of KMS vault (VIRTUAL_PRIVATE or DEFAULT)"
  type        = string
  default     = "DEFAULT"
}

variable "kms_vault_defined_tags" {
  description = "Defined tags for the KMS vault"
  type        = map(string)
  default     = {}
}

variable "is_kms_vault_external_key_manager" {
  description = "Whether to use an external key manager"
  type        = bool
  default     = false
}

variable "kms_vault_external_key_manager_metadata_external_vault_endpoint_url" {
  description = "External key manager endpoint URL"
  type        = string
  default     = ""
}

variable "kms_vault_external_key_manager_metadata_oauth_metadata_client_app_id" {
  description = "OAuth client app ID for external key manager"
  type        = string
  default     = ""
  sensitive   = true
}

variable "kms_vault_external_key_manager_metadata_oauth_metadata_clientapp_secret" {
  description = "OAuth client app secret for external key manager"
  type        = string
  default     = ""
  sensitive   = true
}

variable "kms_vault_external_key_manager_metadata_oauth_metadata_idcs_account_name_url" {
  description = "IDCS account name URL for external key manager"
  type        = string
  default     = ""
}

variable "kms_vault_external_key_manager_metadata_private_endpoint_id" {
  description = "Private endpoint ID for external key manager"
  type        = string
  default     = ""
}

variable "kms_vault_freeform_tags" {
  description = "Free-form tags for the KMS vault"
  type        = map(string)
  default     = {}
}

variable "is_kms_vault_restore_from_file" {
  description = "Whether to restore the vault from a file"
  type        = bool
  default     = false
}

variable "kms_vault_restore_from_file_content_length" {
  description = "The content length of the file to restore"
  type        = number
  default     = null
}

variable "kms_vault_restore_from_file_content_md5" {
  description = "The MD5 checksum of the file to restore"
  type        = string
  default     = ""
}

variable "kms_vault_restore_from_file_restore_vault_from_file_details" {
  description = "The file content details for vault restoration"
  type        = string
  default     = ""
}

variable "is_kms_vault_restore_from_object_store" {
  description = "Whether to restore the vault from Object Storage"
  type        = bool
  default     = false
}

variable "kms_vault_restore_from_object_store_bucket" {
  description = "The Object Storage bucket name for restoration"
  type        = string
  default     = ""
}

variable "kms_vault_restore_from_object_store_destination" {
  description = "The destination for restoring from Object Storage"
  type        = string
  default     = ""
}

variable "kms_vault_restore_from_object_store_namespace" {
  description = "The Object Storage namespace for restoration"
  type        = string
  default     = ""
}

variable "kms_vault_restore_from_object_store_object" {
  description = "The Object Storage object name for restoration"
  type        = string
  default     = ""
}

variable "kms_vault_restore_from_object_store_uri" {
  description = "The Object Storage URI for restoration"
  type        = string
  default     = ""
}

variable "kms_vault_time_of_deletion" {
  description = "The time when the vault will be deleted (ISO format)"
  type        = string
  default     = null
}

# KMS Key Variables
variable "kms_key_compartment_id" {
  description = "The OCID of the compartment where the KMS key will be created"
  type        = string
}

variable "kms_key_display_name" {
  description = "A user-friendly name for the KMS key"
  type        = string
}

variable "kms_key_key_shape_algorithm" {
  description = "The algorithm used for the KMS key (AES, RSA, ECDSA, ED25519)"
  type        = string
  default     = "AES"
}

variable "kms_key_key_shape_length" {
  description = "The length of the KMS key in bits"
  type        = number
  default     = 16
}

variable "kms_key_key_shape_curve_id" {
  description = "The elliptic curve ID for ECDSA keys"
  type        = string
  default     = ""
}

variable "kms_key_desired_state" {
  description = "The desired state of the KMS key (ENABLED, DISABLED, PENDING_DELETION, SCHEDULED_FOR_DELETION)"
  type        = string
  default     = "ENABLED"
}

variable "is_kms_key_external_key_reference" {
  description = "Whether to use an external key reference"
  type        = bool
  default     = false
}

variable "kms_key_external_key_reference_external_key_id" {
  description = "The external key ID for external key reference"
  type        = string
  default     = ""
}

variable "is_kms_key_auto_rotation_enabled" {
  description = "Whether automatic key rotation is enabled"
  type        = bool
  default     = false
}

variable "kms_key_auto_key_rotation_details_last_rotation_message" {
  description = "The message from the last key rotation"
  type        = string
  default     = ""
}

variable "kms_key_auto_key_rotation_details_last_rotation_status" {
  description = "The status of the last key rotation"
  type        = string
  default     = ""
}

variable "kms_key_auto_key_rotation_details_rotation_interval_in_days" {
  description = "The interval in days for automatic key rotation"
  type        = number
  default     = 365
}

variable "kms_key_auto_key_rotation_details_time_of_last_rotation" {
  description = "The time of the last key rotation (ISO format)"
  type        = string
  default     = null
}

variable "kms_key_auto_key_rotation_details_time_of_next_rotation" {
  description = "The time of the next scheduled key rotation (ISO format)"
  type        = string
  default     = null
}

variable "kms_key_auto_key_rotation_details_time_of_schedule_start" {
  description = "The time when automatic rotation schedule starts (ISO format)"
  type        = string
  default     = null
}

variable "kms_key_protection_mode" {
  description = "The protection mode of the KMS key (HSM or SOFTWARE)"
  type        = string
  default     = "HSM"
}

variable "is_kms_key_restore_from_file" {
  description = "Whether to restore the key from a file"
  type        = bool
  default     = null
}

variable "kms_key_restore_from_file_content_length" {
  description = "The content length of the restore file"
  type        = number
  default     = null
}

variable "kms_key_restore_from_file_content_md5" {
  description = "The MD5 checksum of the restore file"
  type        = string
  default     = ""
}

variable "kms_key_restore_key_from_file_details" {
  description = "The restore file content details"
  type        = string
  default     = ""
}

variable "is_kms_key_restore_from_object_store" {
  description = "Whether to restore the key from Object Storage"
  type        = bool
  default     = null
}

variable "kms_key_restore_from_object_store_bucket" {
  description = "The Object Storage bucket name for key restoration"
  type        = string
  default     = ""
}

variable "kms_key_restore_from_object_store_destination" {
  description = "The destination for key restoration from Object Storage"
  type        = string
  default     = ""
}

variable "kms_key_restore_from_object_store_namespace" {
  description = "The Object Storage namespace for key restoration"
  type        = string
  default     = ""
}

variable "kms_key_restore_from_object_store_object" {
  description = "The Object Storage object name for key restoration"
  type        = string
  default     = ""
}

variable "kms_key_restore_from_object_store_uri" {
  description = "The Object Storage URI for key restoration"
  type        = string
  default     = ""
}

variable "kms_key_restore_trigger" {
  description = "Trigger value for key restoration"
  type        = bool
  default     = null
}

variable "kms_key_time_of_deletion" {
  description = "The time when the key will be deleted (ISO format)"
  type        = string
  default     = null
}

variable "kms_key_defined_tags" {
  description = "Defined tags for the KMS key"
  type        = map(string)
  default     = {}
}

variable "kms_key_freeform_tags" {
  description = "Free-form tags for the KMS key"
  type        = map(string)
  default     = {}
}

# ============================================================================
# Vault Secret Variables
#
# Provide secrets as a map of objects. Each map entry represents one secret
# and should include fields referenced by `vault_secret.tf` (see below).
# Example shape:
# {
#   my_secret = {
#     vault_secret_compartment_id = "ocid1.compartment.oc1..example"
#     vault_secret_secret_name    = "my-secret"
#     vault_secret_defined_tags   = {}
#     vault_secret_freeform_tags  = {}
#     vault_secret_description    = "Optional description"
#     vault_secret_enable_auto_generation = false
#     vault_secret_metadata       = {}
#     is_enable_vault_secret_replication_config = false
#     vault_secret_replication_config_replication_targets_target_key_id = ""
#     vault_secret_replication_config_replication_targets_region = ""
#     vault_secret_replication_config_replication_targets_target_vault_id = ""
#     vault_secret_replication_config_is_write_forward_enabled = false
#     is_enable_vault_secret_rotation_config = false
#     vault_secret_rotation_config_target_system_details_target_system_type = ""
#     vault_secret_rotation_config_target_system_details_adb_id = ""
#     vault_secret_rotation_config_target_system_details_function_id = ""
#     vault_secret_rotation_config_is_scheduled_rotation_enabled = false
#     vault_secret_rotation_config_rotation_interval = 0
#     vault_secret_secret_content = null
#     vault_secret_secret_generation_context = {}
#     vault_secret_secret_rules = null
#   }
# }
# ============================================================================

variable "vault_secret_map" {
  description = "Map of secret definitions keyed by arbitrary name. Each value is an object with the fields used by vault_secret.tf"
  type = map(object({
    vault_secret_compartment_id                                             = string
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
    is_vault_secret_secret_content_definded                                 = bool
    vault_secret_secret_content_type                                        = optional(string, null)
    vault_secret_secret_content                                             = optional(any, null)
    vault_secret_secret_content_name                                        = optional(string, null)
    vault_secret_secret_content_stage                                       = optional(string, null)
    is_vault_secret_secret_generation_context_definded                      = bool
    vault_secret_secret_generation_context                                  = optional(any, null)
    vault_secret_secret_generation_type                                     = optional(string, null)
    vault_secret_secret_generation_passphrase_length                        = optional(number, null)
    vault_secret_secret_generation_template                                 = optional(string, null)
    is_vault_secret_secret_rules_definded                                   = bool
    vault_secret_secret_rules_is_enforced_on_deleted_secret_versions        = optional(bool, null)
    vault_secret_secret_rules_is_secret_content_retrieval_blocked_on_expiry = optional(bool, null)
    vault_secret_secret_rules_rule_type                                     = optional(string, null)
    vault_secret_secret_rules_secret_version_expiry_interval                = optional(string, null)
    vault_secret_secret_rules_time_of_absolute_expiry                       = optional(string, null)
  }))
  default = {}
}
