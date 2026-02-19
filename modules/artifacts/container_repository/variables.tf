# ============================================================================
# Container Configuration Variables
# ============================================================================

variable "container_configuration_is_repository_created_on_first_push" {
  description = "Whether to create a repository automatically on first push"
  type        = bool
  default     = false
}

variable "container_configuration_compartment_id" {
  description = "The OCID of the compartment for container configuration"
  type        = string
}

# ============================================================================
# Container Repository Variables
# ============================================================================

variable "container_repository_map" {
  description = "Map of container repository definitions keyed by an arbitrary name"
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
