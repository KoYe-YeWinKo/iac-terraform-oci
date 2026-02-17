# ============================================================================
# Container Configuration Variables
# ============================================================================

variable "container_configuration_namespace" {
  description = "The namespace for container configuration (typically the tenancy namespace)"
  type        = string
}

variable "container_configuration_is_repository_created_on_first_push" {
  description = "Whether to create a repository automatically on first push"
  type        = bool
  default     = false
}

# ============================================================================
# Container Repository Variables
# ============================================================================

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
