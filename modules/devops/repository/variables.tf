###############################################
# Variables for DevOps Repository Module
###############################################

variable "devops_repository_project_id" {
  description = "Project ID for the DevOps repository."
  type        = string
}

variable "devops_repository_name" {
  description = "Name for the DevOps repository."
  type        = string
}

variable "devops_repository_description" {
  description = "Description for the DevOps repository."
  type        = string
  default     = null
}

variable "devops_repository_repository_type" {
  description = "Type of the DevOps repository."
  type        = string
  default     = "HOSTED"
}

variable "devops_repository_default_branch" {
  description = "Default branch for the DevOps repository."
  type        = string
  default     = "main"
}

variable "devops_repository_freeform_tags" {
  description = "Freeform tags for the DevOps repository."
  type        = map(string)
  default     = {}
}

variable "devops_repository_defined_tags" {
  description = "Defined tags for the DevOps repository."
  type        = map(any)
  default     = {}
}

variable "is_devops_repository_type_mirror" {
  description = "Flag to indicate if the repository type is mirror."
  type        = bool
  default     = false
}

variable "devops_repository_mirror_repository_config_repository_url" {
  description = "Repository URL for the mirror repository config."
  type        = string
  default     = null
}

variable "devops_repository_mirror_repository_config_custom_schedule" {
  description = "Custom schedule for the mirror repository config trigger."
  type        = string
  default     = null
}

variable "devops_repository_mirror_repository_config_schedule_type" {
  description = "Schedule type for the mirror repository config trigger."
  type        = string
  default     = null
}

variable "devops_repository_parent_repository_id" {
  description = "Parent repository ID for the DevOps repository (optional)."
  type        = string
  default     = null
}

###############################################
# Variables for DevOps Connection
###############################################

variable "devops_connection_access_token" {
  description = "Access token for the DevOps connection."
  type        = string
  default     = null
}

variable "devops_connection_app_password" {
  description = "App password for the DevOps connection."
  type        = string
  default     = null
}

variable "devops_connection_base_url" {
  description = "Base URL for the DevOps connection."
  type        = string
  default     = null
}

variable "devops_connection_connection_type" {
  description = "Type of the DevOps connection."
  type        = string
  default     = null
}

variable "devops_connection_defined_tags" {
  description = "Defined tags for the DevOps connection."
  type        = map(any)
  default     = {}
}

variable "devops_connection_description" {
  description = "Description for the DevOps connection."
  type        = string
  default     = null
}

variable "devops_connection_display_name" {
  description = "Display name for the DevOps connection."
  type        = string
  default     = null
}

variable "devops_connection_freeform_tags" {
  description = "Freeform tags for the DevOps connection."
  type        = map(string)
  default     = {}
}
