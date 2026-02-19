# Provider variables (common)
variable "my_oci_tenancy_ocid" { type = string }
variable "my_user_ocid" { type = string }
variable "my_user_fingerprint" { type = string }
variable "my_user_private_key_path" { type = string }
variable "my_oci_region" { type = string }

# Build pipeline module inputs
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

variable "build_pipeline_parameters" {
  description = "List of pipeline parameter objects"
  type = list(object({
    name          = string
    description   = optional(string)
    default_value = optional(string)
  }))
  default = []
}

variable "build_pipeline_defined_tags" {
  type    = map(string)
  default = {}
}

variable "build_pipeline_freeform_tags" {
  type    = map(string)
  default = {}
}
