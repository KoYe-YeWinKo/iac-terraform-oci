# ============================================================================
# Provider variables (from common.tfvars)
# ============================================================================
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

# ============================================================================
# Generic Artifacts Module Variables
# ============================================================================

variable "artifacts_repository_compartment_id" {
  description = "The OCID of the compartment where the artifacts repository will be created"
  type        = string
}

variable "artifacts_repository_display_name" {
  description = "Display name for the artifacts repository"
  type        = string
}

variable "artifacts_repository_description" {
  description = "Description for the artifacts repository"
  type        = string
  default     = null
}

variable "artifacts_repository_is_immutable" {
  description = "Whether the repository is immutable (prevents artifact modification/deletion)"
  type        = bool
  default     = false
}

variable "artifacts_repository_repository_type" {
  description = "The type of the repository (e.g., GENERIC)"
  type        = string
  default     = "GENERIC"
}

variable "artifacts_repository_defined_tags" {
  description = "Defined tags for the artifacts repository"
  type        = map(string)
  default     = {}
}

variable "artifacts_repository_freeform_tags" {
  description = "Freeform tags for the artifacts repository"
  type        = map(string)
  default     = {}
}

variable "generic_artifact_content_map" {
  description = "Map of generic artifact content entries with paths, versions, and content"
  type = map(object({
    generic_artifact_artifact_path   = string
    generic_artifact_content_version = string
    generic_artifact_content_source  = optional(string, null)
    generic_artifact_content_content = optional(string, null)
    generic_artifact_defined_tags    = optional(map(map(string)), {})
    generic_artifact_freeform_tags   = optional(map(string), {})
  }))
  default = {}
}
