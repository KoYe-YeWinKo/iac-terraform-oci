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
# Container Repository Module Variables
# ============================================================================

variable "container_configuration_namespace" {
  description = "The namespace for container configuration (typically the tenancy namespace)"
  type        = string
}

variable "container_configuration_is_repository_created_on_first_push" {
  description = "Whether to create a repository automatically on first push"
  type        = bool
  default     = true
}

variable "container_repository_compartment_id" {
  description = "The OCID of the compartment where the container repository will be created"
  type        = string
}

variable "container_repository_display_name" {
  description = "Display name for the container repository"
  type        = string
}

variable "container_repository_is_immutable" {
  description = "Whether the repository is immutable (prevents image modification/deletion)"
  type        = bool
  default     = false
}

variable "container_repository_is_public" {
  description = "Whether the repository is public (allows anonymous access)"
  type        = bool
  default     = false
}

variable "container_repository_readme_content" {
  description = "Content of the repository README"
  type        = string
  default     = null
}

variable "container_repository_readme_format" {
  description = "Format of the README content (e.g., MARKDOWN, PLAINTEXT)"
  type        = string
  default     = null
}

variable "container_repository_defined_tags" {
  description = "Defined tags for the container repository"
  type        = map(map(string))
  default     = {}
}

variable "container_repository_freeform_tags" {
  description = "Freeform tags for the container repository"
  type        = map(string)
  default     = {}
}
