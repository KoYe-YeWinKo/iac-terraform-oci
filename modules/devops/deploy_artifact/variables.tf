variable "devops_deploy_artifact_display_name" {
  description = "Display name for the deploy artifact"
  type        = string
}

variable "devops_deploy_artifact_project_id" {
  description = "OCID of the DevOps project"
  type        = string
}

variable "devops_deploy_artifact_description" {
  description = "Description for the deploy artifact"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_defined_tags" {
  description = "Defined tags for the deploy artifact"
  type        = map(string)
  default     = {}
}

variable "devops_deploy_artifact_freeform_tags" {
  description = "Freeform tags for the deploy artifact"
  type        = map(string)
  default     = {}
}

variable "devops_deploy_artifact_argument_substitution_mode" {
  description = "Argument substitution mode for deploy artifact"
  type        = optional(string, null)
  default     = null
}

# source block
variable "devops_deploy_artifact_source_base64encodedcontent" {
  description = "Base64 encoded content for the deploy artifact source"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_source_chart_url" {
  description = "Chart URL for helm deploy artifact source"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_source_deploy_artifact_path" {
  description = "Path for deploy artifact source"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_source_deploy_artifact_source_type" {
  description = "Type of deploy artifact source (e.g., OCI_HELM_CHART, etc)"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_source_deploy_artifact_version" {
  description = "Version identifier for the deploy artifact"
  type        = optional(string, null)
  default     = null
}

# helm verification key source
variable "devops_deploy_artifact_source_helm_verification_key_source_current_public_key" {
  description = "Current public key for helm verification"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_source_helm_verification_key_source_previous_public_key" {
  description = "Previous public key for helm verification"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_source_helm_verification_key_source_vault_secret_id" {
  description = "Vault secret OCID holding the verification key"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_source_helm_verification_key_source_verification_key_source_type" {
  description = "Type of verification key source for helm (e.g., PUBLIC_KEY, VAULT_SECRET)"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_source_image_digest" {
  description = "Digest of the image for deploy artifact source"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_source_image_url" {
  description = "URL of the image for deploy artifact source"
  type        = optional(string, null)
  default     = null
}

variable "devops_deploy_artifact_source_repository_id" {
  description = "Repository OCID for deploy artifact source"
  type        = optional(string, null)
  default     = null
}
