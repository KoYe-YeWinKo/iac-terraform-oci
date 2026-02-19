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


# KMS Key Configuration (map)
# Provide KMS keys as a map of objects keyed by an arbitrary name. Each
# object should match the fields used by the module's `kms_key_map`.
variable "kms_key_map" {
  description = "Map of KMS key definitions keyed by an arbitrary name for sample use"
  type = map(object({
    kms_key_compartment_id = string
    kms_key_display_name   = string

    kms_key_key_shape_algorithm = optional(string, "AES")
    kms_key_key_shape_length    = optional(number, 256)
    kms_key_key_shape_curve_id  = optional(string, null)

    kms_key_desired_state = optional(string, "ENABLED")

    is_kms_key_external_key_reference              = optional(bool, false)
    kms_key_external_key_reference_external_key_id = optional(string, null)

    is_kms_key_auto_rotation_enabled                            = optional(bool, false)
    kms_key_auto_key_rotation_details_last_rotation_message     = optional(string, null)
    kms_key_auto_key_rotation_details_last_rotation_status      = optional(string, null)
    kms_key_auto_key_rotation_details_rotation_interval_in_days = optional(number, 365)
    kms_key_auto_key_rotation_details_time_of_last_rotation     = optional(string, null)
    kms_key_auto_key_rotation_details_time_of_next_rotation     = optional(string, null)
    kms_key_auto_key_rotation_details_time_of_schedule_start    = optional(string, null)

    kms_key_protection_mode = optional(string, "HSM")

    is_kms_key_restore_from_file             = optional(bool, false)
    kms_key_restore_from_file_content_length = optional(number, null)
    kms_key_restore_from_file_content_md5    = optional(string, null)
    kms_key_restore_key_from_file_details    = optional(string, null)

    is_kms_key_restore_from_object_store          = optional(bool, false)
    kms_key_restore_from_object_store_bucket      = optional(string, null)
    kms_key_restore_from_object_store_destination = optional(string, null)
    kms_key_restore_from_object_store_namespace   = optional(string, null)
    kms_key_restore_from_object_store_object      = optional(string, null)
    kms_key_restore_from_object_store_uri         = optional(string, null)

    kms_key_restore_trigger  = optional(bool, false)
    kms_key_time_of_deletion = optional(string, null)

    kms_key_defined_tags  = optional(map(string), {})
    kms_key_freeform_tags = optional(map(string), {})
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
