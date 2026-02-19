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

###############################################
# Variables for DevOps Project Repository Setting Module
###############################################

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

