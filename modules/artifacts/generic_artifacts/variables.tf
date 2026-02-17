# ============================================================================
# Artifacts Repository Variables
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
  type        = map(map(string))
  default     = {}
}

variable "artifacts_repository_freeform_tags" {
  description = "Freeform tags for the artifacts repository"
  type        = map(string)
  default     = {}
}

# ============================================================================
# Generic Artifact Content Variables
# ============================================================================

variable "generic_artifact_content_artifact_path" {
  description = "Path of the artifact (e.g., my-app/app.jar)"
  type        = string
}

variable "generic_artifact_content_version" {
  description = "Version identifier for the artifact"
  type        = string
}

variable "generic_artifact_content_source" {
  description = "Source location of the artifact (file path or URI)"
  type        = string
  default     = null
}

variable "generic_artifact_content_content" {
  description = "The content of the artifact (binary or text)"
  type        = string
  default     = null
}

variable "generic_artifact_content_defined_tags" {
  description = "Defined tags for the artifact content"
  type        = map(map(string))
  default     = {}
}

variable "generic_artifact_content_freeform_tags" {
  description = "Freeform tags for the artifact content"
  type        = map(string)
  default     = {}
}

# ============================================================================
# Generic Artifact Variables
# ============================================================================

variable "generic_artifact_defined_tags" {
  description = "Defined tags for the generic artifact"
  type        = map(map(string))
  default     = {}
}

variable "generic_artifact_freeform_tags" {
  description = "Freeform tags for the generic artifact"
  type        = map(string)
  default     = {}
}
