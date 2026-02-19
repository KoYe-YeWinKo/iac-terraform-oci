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
variable "kms_key_map" {
  description = "Map of KMS key definitions keyed by arbitrary name. Each object matches fields used in kms_key.tf"
  type = map(object({
    kms_key_compartment_id      = string
    kms_key_display_name        = string
    kms_key_key_shape_algorithm = optional(string, "AES")
    kms_key_key_shape_length    = optional(number, 16)
    kms_key_key_shape_curve_id  = optional(string, null)
    kms_key_desired_state       = optional(string, "ENABLED")

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