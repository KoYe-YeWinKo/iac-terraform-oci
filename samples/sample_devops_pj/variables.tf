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
