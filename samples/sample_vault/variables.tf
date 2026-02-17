# ============================================================================
# KMS Vault Variables for Sample Configuration
# ============================================================================

# Required: Compartment ID for the KMS Vault
variable "kms_vault_compartment_id" {
  description = "The OCID of the compartment where the KMS Vault will be created"
  type        = string
}

# Required: Display name for the KMS Vault
variable "kms_vault_display_name" {
  description = "A user-friendly name for the KMS Vault"
  type        = string
}

# Optional: Type of KMS Vault (VIRTUAL_PRIVATE or DEFAULT)
variable "kms_vault_type" {
  description = "The type of KMS Vault (VIRTUAL_PRIVATE or DEFAULT)"
  type        = string
  default     = "DEFAULT"
}

# Optional: Defined tags for the KMS Vault
variable "kms_vault_defined_tags" {
  description = "Defined tags for the KMS Vault (Oracle-managed tags)"
  type        = map(string)
  default     = {}
}

# Optional: Free-form tags for the KMS Vault
variable "kms_vault_freeform_tags" {
  description = "Free-form tags for the KMS Vault (user-defined tags)"
  type        = map(string)
  default     = {}
}

# ============================================================================
# External Key Manager Configuration Variables
# ============================================================================

# Optional: Enable external key manager integration
variable "is_kms_vault_external_key_manager" {
  description = "Whether to use an external key manager"
  type        = bool
  default     = false
}

# Optional: External key manager endpoint URL
variable "kms_vault_external_key_manager_metadata_external_vault_endpoint_url" {
  description = "The endpoint URL for the external key manager"
  type        = string
  default     = ""
}

# Optional: OAuth client app ID for external key manager
variable "kms_vault_external_key_manager_metadata_oauth_metadata_client_app_id" {
  description = "OAuth client app ID for external key manager authentication"
  type        = string
  default     = ""
  sensitive   = true
}

# Optional: OAuth client app secret for external key manager
variable "kms_vault_external_key_manager_metadata_oauth_metadata_clientapp_secret" {
  description = "OAuth client app secret for external key manager authentication"
  type        = string
  default     = ""
  sensitive   = true
}

# Optional: IDCS account name URL for OAuth
variable "kms_vault_external_key_manager_metadata_oauth_metadata_idcs_account_name_url" {
  description = "IDCS account name URL for OAuth authentication with external key manager"
  type        = string
  default     = ""
}

# Optional: Private endpoint ID for external key manager
variable "kms_vault_external_key_manager_metadata_private_endpoint_id" {
  description = "Private endpoint ID for connecting to the external key manager"
  type        = string
  default     = ""
}

# ============================================================================
# Vault Restoration from File Configuration Variables
# ============================================================================

# Optional: Restore vault from a file
variable "is_kms_vault_restore_from_file" {
  description = "Whether to restore the KMS Vault from a file"
  type        = bool
  default     = false
}

# Optional: Content length of the restore file
variable "kms_vault_restore_from_file_content_length" {
  description = "The content length of the file to restore (in bytes)"
  type        = number
  default     = null
}

# Optional: MD5 checksum of the restore file
variable "kms_vault_restore_from_file_content_md5" {
  description = "The MD5 checksum of the restore file for integrity verification"
  type        = string
  default     = ""
}

# Optional: Restore file content details
variable "kms_vault_restore_from_file_restore_vault_from_file_details" {
  description = "The file content details for vault restoration (base64 encoded)"
  type        = string
  default     = ""
}

# ============================================================================
# Vault Restoration from Object Storage Configuration Variables
# ============================================================================

# Optional: Restore vault from Object Storage
variable "is_kms_vault_restore_from_object_store" {
  description = "Whether to restore the KMS Vault from Object Storage"
  type        = bool
  default     = false
}

# Optional: Object Storage bucket name
variable "kms_vault_restore_from_object_store_bucket" {
  description = "The Object Storage bucket name containing the vault backup"
  type        = string
  default     = ""
}

# Optional: Destination for Object Storage restoration
variable "kms_vault_restore_from_object_store_destination" {
  description = "The destination for restoring from Object Storage (e.g., CURRENT_VAULT)"
  type        = string
  default     = ""
}

# Optional: Object Storage namespace
variable "kms_vault_restore_from_object_store_namespace" {
  description = "The Object Storage namespace (typically your tenancy namespace)"
  type        = string
  default     = ""
}

# Optional: Object Storage object name (backup file)
variable "kms_vault_restore_from_object_store_object" {
  description = "The Object Storage object name containing the vault backup"
  type        = string
  default     = ""
}

# Optional: Object Storage URI for restoration
variable "kms_vault_restore_from_object_store_uri" {
  description = "The full Object Storage URI for vault restoration"
  type        = string
  default     = ""
}


# ============================================================================
# Vault Lifecycle Configuration Variables
# ============================================================================

# Optional: Vault deletion schedule
variable "kms_vault_time_of_deletion" {
  description = "The time when the vault will be deleted (ISO 8601 format, e.g., 2026-12-31T23:59:59Z)"
  type        = string
  default     = null
}

# ============================================================================
# KMS Key Configuration Variables
# ============================================================================

# Required: Compartment ID for the KMS Key
variable "kms_key_compartment_id" {
  description = "The OCID of the compartment where the KMS Key will be created"
  type        = string
}

# Required: Display name for the KMS Key
variable "kms_key_display_name" {
  description = "A user-friendly name for the KMS Key"
  type        = string
}

# Optional: Key shape algorithm (AES, RSA, ECDSA, ED25519)
variable "kms_key_key_shape_algorithm" {
  description = "The algorithm used for the KMS Key (AES, RSA, ECDSA, ED25519)"
  type        = string
  default     = "AES"
}

# Optional: Key length in bits
variable "kms_key_key_shape_length" {
  description = "The length of the KMS Key in bits (e.g., 128, 192, 256 for AES)"
  type        = number
  default     = 256
}

# Optional: Elliptic curve ID for ECDSA keys
variable "kms_key_key_shape_curve_id" {
  description = "The elliptic curve ID for ECDSA keys (e.g., NIST_P256)"
  type        = string
  default     = ""
}

# Optional: Desired state of the KMS Key
variable "kms_key_desired_state" {
  description = "The desired state of the KMS Key (ENABLED, DISABLED, PENDING_DELETION, SCHEDULED_FOR_DELETION)"
  type        = string
  default     = "ENABLED"
}

# ============================================================================
# External Key Reference Configuration Variables
# ============================================================================

# Optional: Enable external key reference
variable "is_kms_key_external_key_reference" {
  description = "Whether to use an external key reference"
  type        = bool
  default     = false
}

# Optional: External key ID to reference
variable "kms_key_external_key_reference_external_key_id" {
  description = "The external key ID to reference"
  type        = string
  default     = ""
}

# ============================================================================
# Automatic Key Rotation Configuration Variables
# ============================================================================

# Optional: Enable automatic key rotation
variable "is_kms_key_auto_rotation_enabled" {
  description = "Whether automatic key rotation is enabled"
  type        = bool
  default     = false
}

# Optional: Last rotation message
variable "kms_key_auto_key_rotation_details_last_rotation_message" {
  description = "The message from the last key rotation"
  type        = string
  default     = ""
}

# Optional: Last rotation status
variable "kms_key_auto_key_rotation_details_last_rotation_status" {
  description = "The status of the last key rotation (e.g., SUCCESS, FAILED)"
  type        = string
  default     = ""
}

# Optional: Rotation interval in days
variable "kms_key_auto_key_rotation_details_rotation_interval_in_days" {
  description = "The interval in days for automatic key rotation (e.g., 365)"
  type        = number
  default     = 365
}

# Optional: Time of last rotation
variable "kms_key_auto_key_rotation_details_time_of_last_rotation" {
  description = "The time of the last key rotation (ISO 8601 format)"
  type        = string
  default     = null
}

# Optional: Time of next scheduled rotation
variable "kms_key_auto_key_rotation_details_time_of_next_rotation" {
  description = "The time of the next scheduled key rotation (ISO 8601 format)"
  type        = string
  default     = null
}

# Optional: Time when rotation schedule starts
variable "kms_key_auto_key_rotation_details_time_of_schedule_start" {
  description = "The time when automatic rotation schedule starts (ISO 8601 format)"
  type        = string
  default     = null
}

# ============================================================================
# Key Protection and Rotation from File Configuration Variables
# ============================================================================

# Optional: Protection mode
variable "kms_key_protection_mode" {
  description = "The protection mode of the KMS Key (HSM or SOFTWARE)"
  type        = string
  default     = "HSM"
}

# Optional: Restore key from a file
variable "is_kms_key_restore_from_file" {
  description = "Whether to restore the key from a file"
  type        = bool
  default     = false
}

# Optional: Content length of the restore file
variable "kms_key_restore_from_file_content_length" {
  description = "The content length of the restore file (in bytes)"
  type        = number
  default     = null
}

# Optional: MD5 checksum of the restore file
variable "kms_key_restore_from_file_content_md5" {
  description = "The MD5 checksum of the restore file for integrity verification"
  type        = string
  default     = ""
}

# Optional: Restore file content details
variable "kms_key_restore_key_from_file_details" {
  description = "The restore file content details (base64 encoded key material)"
  type        = string
  default     = ""
}

# ============================================================================
# Key Rotation from Object Storage Configuration Variables
# ============================================================================

# Optional: Rotate key from Object Storage
variable "is_kms_key_restore_from_object_store" {
  description = "Whether to restore the key from Object Storage"
  type        = bool
  default     = false
}

# Optional: Object Storage bucket name for key restoration
variable "kms_key_restore_from_object_store_bucket" {
  description = "The Object Storage bucket name containing the key restoration material"
  type        = string
  default     = ""
}

# Optional: Destination for key restoration from Object Storage
variable "kms_key_restore_from_object_store_destination" {
  description = "The destination for key restoration from Object Storage (e.g., CURRENT_KEY)"
  type        = string
  default     = ""
}

# Optional: Object Storage namespace for key restoration
variable "kms_key_restore_from_object_store_namespace" {
  description = "The Object Storage namespace for key restoration"
  type        = string
  default     = ""
}

# Optional: Object Storage object name for key restoration
variable "kms_key_restore_from_object_store_object" {
  description = "The Object Storage object name containing the key restoration material"
  type        = string
  default     = ""
}

# ============================================================================
# Key Lifecycle Configuration Variables
# ============================================================================

# Optional: Key restoration trigger
variable "kms_key_restore_trigger" {
  description = "Trigger value for key restoration (increment to trigger)"
  type        = number
  default     = 0
}

# Optional: Key deletion schedule
variable "kms_key_time_of_deletion" {
  description = "The time when the key will be deleted (ISO 8601 format)"
  type        = string
  default     = null
}

# ============================================================================
# Key Tags Configuration Variables
# ============================================================================

# Optional: Defined tags for the KMS Key
variable "kms_key_defined_tags" {
  description = "Defined tags for the KMS Key (Oracle-managed tags)"
  type        = map(string)
  default     = {}
}

# Optional: Free-form tags for the KMS Key
variable "kms_key_freeform_tags" {
  description = "Free-form tags for the KMS Key (user-defined tags)"
  type        = map(string)
  default     = {}
}

# ============================================================================
# Vault Secret Map (samples)
# ============================================================================
# Provide secrets as a map of objects keyed by an arbitrary name. Each object
# should match the fields used by the `vault_secret` module resource.
variable "vault_secret_map" {
  description = "Map of secret definitions keyed by an arbitrary name for sample use"
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


###############################################
# Provider variables (from common.tfvars)
###############################################
variable "my_oci_tenancy_ocid" {
  description = "OCI tenancy OCID used by the provider."
  type        = string
}

variable "my_user_ocid" {
  description = "OCI user OCID used by the provider."
  type        = string
}

variable "my_user_fingerprint" {
  description = "Fingerprint for the API key used by the provider."
  type        = string
}

variable "my_user_private_key_path" {
  description = "Path to the private key file used by the provider."
  type        = string
}

variable "my_oci_region" {
  description = "OCI region (e.g. 'ap-tokyo-1')."
  type        = string
}
