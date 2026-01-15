variable "availability_domain" {
  description = "The availability domain where the container instance will be created."
  type        = string
  default     = "AVAILABILITY-DOMAIN-1"
}

variable "compartment_id" {
  description = "The OCID of the compartment where the container instance will be created."
  type        = string
}

variable "container_restart_policy" {
  description = "The restart policy for the container instance."
  type        = string
  default     = "ALWAYS"
}

variable "containers" {
  description = "A list of container configurations for the container instance."
  type = list(object({
    arguments             = optional(list(string), [])
    command               = optional(list(string), [])
    defined_tags          = optional(map(map(string)), {})
    display_name          = string
    environment_variables = optional(map(string), {})
    freeform_tags         = optional(map(string), {})
    health_checks = optional(list(object({
      failure_action    = optional(string, "")
      failure_threshold = optional(number, 0)
      headers = optional(list(object({
        name  = optional(string, "")
        value = optional(string, "")
      })), [])
      health_check_type        = string
      initial_delay_in_seconds = optional(number, 0)
      interval_in_seconds      = optional(number, 0)
      name                     = optional(string, "")
      path                     = optional(string, "")
      port                     = optional(number, 0)
      success_threshold        = optional(number, 0)
      timeout_in_seconds       = optional(number, 0)
    })), [])
    image_url                      = string
    is_resource_principal_disabled = optional(bool, false)
    resource_config = optional(object({
      memory_limit_in_gbs = optional(number, 1)
      vcpus_limit         = optional(number, 1)
    }), {})
    security_context = optional(object({
      capabilities = optional(object({
        add_capabilities  = optional(list(string), [])
        drop_capabilities = optional(list(string), [])
      }), {})
      is_non_root_user_check_enabled = optional(bool, false)
      is_root_file_system_readonly   = optional(bool, false)
      run_as_group                   = optional(number, 0)
      run_as_user                    = optional(number, 0)
      security_context_type          = optional(string, "")
    }), {})
    volume_mounts = optional(list(object({
      is_read_only = optional(bool, false)
      mount_path   = string
      partition    = optional(string, "")
      sub_path     = optional(string, "")
      volume_name  = string
    })), [])
    working_directory = optional(string, "")
  }))
}

variable "defined_tags" {
  description = "A map of defined tags to assign to the container instance."
  type        = map(map(string))
  default     = {}
}

variable "display_name" {
  description = "The display name for the container instance."
  type        = string
}

variable "dns_config" {
  description = "The DNS configuration for the container instance."
  type = object({
    hostname_label = string
    search_domains = optional(list(string), [])
  })
  default = null
}

variable "fault_domain" {
  description = "The fault domain where the container instance will be created."
  type        = string
  default     = "FAULT-DOMAIN-1"
}

variable "freeform_tags" {
  description = "A map of freeform tags to assign to the container instance."
  type        = map(string)
  default     = {}
}

variable "gracefull_shutdown_in_seconds" {
  description = "The time in seconds to wait for the container instance to shut down gracefully."
  type        = number
  default     = 30
}

variable "image_pull_secrets" {
  description = "A list of image pull secrets for the container instance."
  type = list(object({
    secret_type       = optional(string, "VAULT")
    registry_endpoint = string
    secret_id         = string
  }))
  default = []
}

variable "shape" {
  description = "The shape of the container instance."
  type        = string
  default     = "VM.Standard.E2.1.Micro"
}

variable "shape_config" {
  description = "The shape configuration for the container instance."
  type = object({
    memory_in_gbs = optional(number, 1)
    ocpus         = number
  })
}

variable "vnics" {
  description = "A list of VNIC configurations for the container instance."
  type = list(object({
    subnet_id              = string
    display_name           = optional(string, "")
    hostname_label         = optional(string, "")
    is_public_ip_assigned  = optional(bool, false)
    nsg_ids                = optional(list(string), [])
    private_ip             = optional(string, "")
    skip_source_dest_check = optional(bool, false)
    defined_tags           = optional(map(map(string)), {})
    freeform_tags          = optional(map(string), {})
  }))
}

variable "volumes" {
  description = "A list of volume configurations for the container instance."
  type = list(object({
    name          = string
    volume_type   = string
    backing_store = optional(string, "")
    configs = optional(object({
      data        = optional(string, "")
      file_name   = optional(string, "")
      source_type = optional(string, "")
    }), {})
  }))
  default = []
}

variable "state" {
  description = "The desired state of the container instance. Can be either 'present' or 'absent'."
  type        = string
  default     = "ACTIVE"
}
