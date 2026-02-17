
variable "build_pipeline_display_name" {
  description = "Display name for the build pipeline"
  type        = string
}

variable "build_pipeline_project_id" {
  description = "The OCID of the DevOps project"
  type        = string
}

variable "build_pipeline_description" {
  description = "Description for the build pipeline"
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
  description = "Free-form tags for the build pipeline"
  type        = map(string)
  default     = {}
}

variable "build_pipeline_stages" {
  description = "Map of build pipeline stages keyed by arbitrary name"
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


