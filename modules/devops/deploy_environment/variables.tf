variable "deploy_environment_display_name" {
  description = "Display name for the deploy environment"
  type        = string
}

variable "deploy_environment_project_id" {
  description = "OCID of the DevOps project"
  type        = string
}

variable "deploy_environment_description" {
  description = "Description for the deploy environment"
  type        = string
  default     = null
}

variable "deploy_environment_deploy_environment_type" {
  description = "Type of the deploy environment (e.g., OKE, COMPUTE, FUNCTION)"
  type        = string
}

variable "deploy_environment_cluster_id" {
  description = "OCID of the cluster (for OKE environments). Use null when not applicable."
  type        = string
  default     = null
}

variable "deploy_environment_compute_instance_group_selectors" {
  description = "List of compute instance group selector objects for compute-based environments"
  type = list(object({
    selector_type        = string
    compute_instance_ids = optional(list(string), null)
    query                = optional(string, null)
    region               = optional(string, null)
  }))
  default = []
}

variable "deploy_environment_function_id" {
  description = "OCID of the Function (for serverless environments). Use null when not applicable."
  type        = string
  default     = null
}

variable "is_oke_cluster_private_network" {
  description = "Whether the OKE cluster uses a private network (controls the network_channel block)"
  type        = bool
  default     = false
}

variable "deploy_environment_network_channel_type" {
  description = "Network channel type used when private network is enabled (e.g., VCN)"
  type        = string
  default     = null
}

variable "deploy_environment_network_channel_nsg_ids" {
  description = "List of NSG OCIDs for the network channel"
  type        = list(string)
  default     = null
}

variable "deploy_environment_network_channel_subnet_id" {
  description = "Subnet OCID for the network channel"
  type        = string
  default     = null
}

variable "deploy_environment_defined_tags" {
  description = "Defined tags for the deploy environment"
  type        = map(string)
  default     = {}
}

variable "deploy_environment_freeform_tags" {
  description = "Freeform tags for the deploy environment"
  type        = map(string)
  default     = {}
}
