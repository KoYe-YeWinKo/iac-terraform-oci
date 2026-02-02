variable "build_pipeline_parameters" {
  description = "A list of parameters for the build pipeline"
  type = object({
    items = list(object({
      default_value = string
      description   = string
      name          = string
    }))
  })
  default = []
}

varaible "defined_tags" {
  description = "A map of defined tags to assign to the build pipeline."
  type        = map(map(string))
  default     = {}
}

variable "description" {
  description = "The description of the build pipeline."
  type        = string
  default     = null
}

variable "display_name" {
  description = "The display name for the build pipeline."
  type        = string
}

variable "freeform_tags" {
  description = "A map of freeform tags to assign to the build pipeline."
  type        = map(string)
  default     = {}
}

variable "project_id" {
  description = "The OCID of the DevOps project."
  type        = string
}

