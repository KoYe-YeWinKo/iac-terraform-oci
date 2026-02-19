variable "deploy_pipeline_display_name" {
  description = "Display name for the deployment pipeline"
  type        = string
}

variable "deploy_pipeline_project_id" {
  description = "The OCID of the DevOps project"
  type        = string
}

variable "deploy_pipeline_description" {
  description = "Description for the deployment pipeline"
  type        = string
  default     = null
}

variable "deploy_pipeline_defined_tags" {
  description = "Defined tags for the deployment pipeline"
  type        = map(string)
  default     = {}
}

variable "deploy_pipeline_freeform_tags" {
  description = "Freeform tags for the deployment pipeline"
  type        = map(string)
  default     = {}
}

variable "deploy_pipeline_parameters" {
  description = "List of deployment pipeline parameter objects"
  type = list(object({
    name          = string
    description   = optional(string)
    default_value = optional(string)
  }))
  default = []
}
