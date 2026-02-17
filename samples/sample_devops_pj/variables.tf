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

###############################################
# Variables for DevOps Project Module
###############################################

variable "devops_project_compartment_id" {
  description = "Compartment OCID for the DevOps project."
  type        = string
}

variable "devops_project_name" {
  description = "Name for the DevOps project."
  type        = string
}

variable "devops_project_description" {
  description = "Description for the DevOps project (optional)."
  type        = string
  default     = null
}

variable "devops_project_freeform_tags" {
  description = "Freeform tags for the DevOps project."
  type        = map(string)
  default     = {}
}

variable "devops_project_defined_tags" {
  description = "Defined tags for the DevOps project."
  type        = map(any)
  default     = {}
}

variable "devops_project_notification_topic_id" {
  description = "Notification topic OCID for the DevOps project (optional)."
  type        = string
  default     = null
}

variable "devops_project_repository_approval_rules_items" {
  description = "Approval rules items for the DevOps project repository."
  type = list(object({
    destination_branch  = string
    min_approvals_count = number
    name                = string
    reviewers = list(object({
      principal_id = string
    }))
  }))
  default = []
}

variable "devops_project_repository_merge_settings_allowed_merge_strategies" {
  description = "Allowed merge strategies for the DevOps project repository."
  type        = list(string)
  default     = ["MERGE_COMMIT", "FAST_FORWARD_ONLY"]
}

variable "devops_project_repository_merge_settings_default_merge_strategy" {
  description = "Default merge strategy for the DevOps project repository."
  type        = string
  default     = "MERGE_COMMIT"
}

###############################################
# Variables for DevOps Repositories Map
###############################################
variable "devops_repositories_map" {
  description = "Map of DevOps repositories to create."
  type = map(object({
    is_devops_repository_type_mirror       = bool
    devops_repository_name                 = string
    devops_repository_description          = optional(string)
    devops_repository_repository_type      = optional(string, "HOSTED")
    devops_repository_parent_repository_id = optional(string)
    devops_repository_default_branch       = optional(string, "main")
    devops_repository_freeform_tags        = optional(map(string), {})
    devops_repository_defined_tags         = optional(map(any), {})
  }))
  default = {}
}


# ============================================================================
# Build Pipeline variables for sample_devops_pj
# ============================================================================

variable "build_pipeline_display_name" {
  description = "Display name for the build pipeline"
  type        = string
}


variable "build_pipeline_description" {
  description = "Optional description for the build pipeline"
  type        = string
  default     = null
}

variable "build_pipeline_parameters_items" {
  description = "List of pipeline parameter objects"
  type = list(object({
    name          = string
    description   = optional(string)
    default_value = optional(string)
  }))
  default = []
}

variable "build_pipeline_defined_tags" {
  description = "Defined tags for the build pipeline"
  type        = map(any)
  default     = {}
}

variable "build_pipeline_freeform_tags" {
  description = "Freeform tags for the build pipeline"
  type        = map(string)
  default     = {}
}

# Optional: Build pipeline stages map
variable "build_pipeline_stages" {
  description = "Map of build pipeline stages keyed by arbitrary name for sample configuration"
  type = map(object({
    display_name  = string
    stage_type    = string
    description   = optional(string, null)
    freeform_tags = optional(map(string), {})
    defined_tags  = optional(map(string), {})
    build_stage_predecessors = optional(list(object({
      predecessor_build_pipeline_stage_id = string
    })), [])
    build_spec = optional(list(object({
      type    = string
      content = string
    })), [])
  }))
  default = {}
}
