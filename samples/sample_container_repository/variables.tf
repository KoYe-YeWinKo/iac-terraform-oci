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



# Container configuration namespace (tenancy namespace)
variable "container_configuration_compartment_id" {
  description = "The OCID of the compartment for container configuration"
  type        = string
}

# ============================================================================
# Container Repository Module Variables
# ============================================================================


variable "container_configuration_is_repository_created_on_first_push" {
  description = "Whether to create a repository automatically on first push"
  type        = bool
  default     = true
}


# Map of container repositories for sample configuration
variable "container_repository_map" {
  description = "Map of container repository definitions keyed by an arbitrary name for sample configuration"
  type = map(object({
    container_repository_compartment_id = string
    container_repository_display_name   = string
    container_repository_defined_tags   = optional(map(any), {})
    container_repository_freeform_tags  = optional(map(string), {})
    container_repository_is_immutable   = optional(bool, false)
    container_repository_is_public      = optional(bool, false)
    container_repository_readme_content = optional(string, null)
    container_repository_readme_format  = optional(string, null)
  }))
  default = {}
}
