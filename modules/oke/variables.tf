###############################################
# Variables for OKE Cluster Module
###############################################

variable "cni_type" {
  description = "CNI type for cluster pod network options."
  type        = string
  default     = "OCI_VCN_IP_NATIVE"
}

variable "oke_cluster_compartment_id" {
  description = "Compartment OCID for the cluster."
  type        = string
}

variable "oke_cluster_defined_tags" {
  description = "Defined tags for the cluster."
  type        = map(any)
  default     = {}
}

variable "oke_cluster_is_public_ip_enabled" {
  description = "Whether the cluster endpoint uses a public IP."
  type        = bool
  default     = false
}

variable "oke_cluster_nsg_ids" {
  description = "Network Security Group OCIDs for the cluster endpoint."
  type        = list(string)
  default     = []
}

variable "cluster_subnet_id" {
  description = "Subnet OCID for the cluster endpoint."
  type        = string
}

variable "oke_cluster_freeform_tags" {
  description = "Freeform tags for the cluster."
  type        = map(string)
  default     = {}
}

variable "oke_is_image_policy_enabled" {
  description = "Enable image policy for the cluster."
  type        = bool
  default     = false
}

variable "oke_cluster_image_policy_kms_key_id" {
  description = "KMS key OCID used by image policy."
  type        = string
  default     = null
}

variable "oke_cluster_kms_key_id" {
  description = "KMS key OCID for the cluster."
  type        = string
  default     = null
}

variable "oke_cluster_kubernetes_version" {
  description = "Kubernetes version for the cluster (e.g. 'v1.25.4')."
  type        = string
  default     = null
}

variable "cluster_name" {
  description = "Name for the cluster."
  type        = string
}

variable "oke_cluster_is_kubernetes_dashboard_enabled" {
  description = "Enable Kubernetes dashboard add-on."
  type        = bool
  default     = false
}

variable "oke_cluster_is_tiller_enabled" {
  description = "Enable Tiller add-on."
  type        = bool
  default     = false
}

variable "is_pod_security_policy_enabled" {
  description = "Enable Pod Security Policy admission controller."
  type        = bool
  default     = false
}

variable "ip_famillies" {
  description = "IP families for cluster networking. Note: name kept to match existing variable usage (typo preserved)."
  type        = list(string)
  default     = ["IPv4"]
}

variable "oke_cluster_pod_cidr" {
  description = "Pod CIDR block for the cluster (optional)."
  type        = string
  default     = null
}

variable "services_cidr" {
  description = "Services CIDR block for the cluster (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_oidc_ca_certificate" {
  description = "OIDC CA certificate (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_oidc_client_id" {
  description = "OIDC client id (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_oidc_configuration_file" {
  description = "OIDC configuration file (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_oidc_groups_claim" {
  description = "OIDC groups claim (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_oidc_groups_prefix" {
  description = "OIDC groups prefix (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_is_oidc_enabled" {
  description = "Whether OIDC is enabled for the cluster."
  type        = bool
  default     = false
}

variable "oke_cluster_oidc_issuer_url" {
  description = "OIDC issuer URL (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_oidc_required_claims_key" {
  description = "Key for required OIDC claims (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_oidc_required_claims_value" {
  description = "Value for required OIDC claims (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_oidc_signing_algorithm" {
  description = "OIDC signing algorithm (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_oidc_username_claim" {
  description = "OIDC username claim (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_oidc_username_prefix" {
  description = "OIDC username prefix (optional)."
  type        = string
  default     = null
}

variable "oke_cluster_is_oidc_discovery_enabled" {
  description = "Whether OIDC discovery is enabled."
  type        = bool
  default     = false
}

variable "oke_cluster_persistent_volume_defined_tags" {
  description = "Defined tags for persistent volumes."
  type        = map(any)
  default     = {}
}

variable "oke_cluster_persistent_volume_freeform_tags" {
  description = "Freeform tags for persistent volumes."
  type        = map(string)
  default     = {}
}

variable "oke_cluster_service_lb_backend_nsg_ids" {
  description = "Backend NSG IDs for the service load balancer."
  type        = list(string)
  default     = []
}

variable "oke_cluster_service_lb_defined_tags" {
  description = "Defined tags for the service load balancer."
  type        = map(any)
  default     = {}
}

variable "oke_clusterservice_lb_freeform_tags" {
  description = "Freeform tags for the service load balancer."
  type        = map(string)
  default     = {}
}

variable "oke_cluster_service_lb_subnet_ids" {
  description = "Subnet IDs for the service load balancer."
  type        = list(string)
  default     = []
}

variable "oke_cluster_type" {
  description = "Cluster type (if required by the provider)."
  type        = string
  default     = null
}

variable "oke_cluster_vcn_id" {
  description = "VCN OCID for the cluster."
  type        = string
}

###############################################
# Variables for OKE Node Pool Module
###############################################

variable "oke_cluster_node_pool_map" {
  description = "Map of node pools to create, keyed by pool name."
  type = map(object({
    oke_cluster_node_pool_compartment_id                         = string
    oke_cluster_node_pool_defined_tags                           = optional(map(any), {})
    oke_cluster_node_pool_freeform_tags                          = optional(map(string), {})
    oke_cluster_node_pool_initial_node_labels                    = optional(map(string), {})
    oke_cluster_node_pool_kubernetes_version                     = optional(string, null)
    oke_cluster_node_pool_name                                   = string
    oke_cluster_node_pool_is_pv_encryption_in_transit_enabled    = optional(bool, false)
    oke_cluster_node_pool_kms_key_id                             = optional(string, null)
    oke_cluster_node_pool_cni_type                               = optional(string, "OCI_VCN_IP_NATIVE")
    oke_cluster_node_pool_max_pods_per_node                      = optional(number, 31)
    oke_cluster_node_pool_pod_nsg_ids                            = optional(list(string), [])
    oke_cluster_node_pool_pod_subnet_ids                         = optional(list(string), [])
    oke_cluster_node_pool_nsg_ids                                = optional(list(string), [])
    oke_cluster_node_pool_node_placement_availability_domain     = string
    oke_cluster_node_pool_node_capacity_reservation_id           = optional(string, null)
    oke_cluster_node_pool_node_placement_fault_domain            = optional(string, null)
    oke_cluster_node_pool_node_preemptible_preserve_boot_volume  = optional(bool, false)
    oke_cluster_node_pool_node_preemptible_action_type           = optional(string, "TERMINATE")
    oke_cluster_node_pool_node_subnet_id                         = string
    oke_cluster_node_pool_node_size                              = number
    oke_cluster_node_pool_eviction_grace_duration                = optional(string, null)
    oke_cluster_node_pool_is_force_action_after_grace_duration   = optional(bool, false)
    oke_cluster_node_pool_is_force_deletion_after_grace_duration = optional(bool, false)
    oke_cluster_node_pool_metadata                               = optional(map(string), {})
    oke_cluster_node_pool_cycle_modes                            = optional(list(string), [])
    oke_cluster_node_pool_is_node_cycling_enabled                = optional(bool, false)
    oke_cluster_node_pool_maximum_surge                          = optional(number, null)
    oke_cluster_node_pool_maximum_unavailable                    = optional(number, null)
    oke_cluster_node_pool_node_shape                             = string
    oke_cluster_node_pool_node_shape_memory_in_gbs               = optional(number, null)
    oke_cluster_node_pool_node_shape_ocpus                       = optional(number, null)
    oke_cluster_node_pool_boot_volume_size_in_gbs                = optional(number, 50)
    oke_cluster_node_pool_image_id                               = optional(string, null)
    oke_cluster_node_pool_source_type                            = optional(string, "IMAGE")
    oke_cluster_node_pool_ssh_public_keys                        = optional(list(string), [])
  }))
  default = {}
}

###############################################
# Variables for OKE Virtual Node Pool Module
###############################################

variable "virtual_node_pool_map" {
  description = "Map of virtual node pools to create, keyed by pool name."
  type = map(object({
    oke_cluster_virtual_node_pool_compartment_id           = string
    oke_cluster_virtual_node_pool_defined_tags             = optional(map(any), {})
    oke_cluster_virtual_node_pool_display_name             = string
    oke_cluster_virtual_node_pool_freeform_tags            = optional(map(string), {})
    oke_cluster_virtual_node_pool_initial_labels           = optional(map(string), {})
    oke_cluster_virtual_node_pool_nsg_ids                  = optional(list(string), [])
    oke_cluster_virtual_node_placement_availability_domain = string
    oke_cluster_virtual_node_placement_fault_domain        = optional(string, null)
    oke_cluster_virtual_node_placement_subnet_id           = string
    oke_cluster_virtual_node_pod_nsg_ids                   = optional(list(string), [])
    oke_cluster_virtual_node_pod_shape                     = string
    oke_cluster_virtual_node_pod_subnet_id                 = string
    oke_cluster_virtual_node_size                          = number
    oke_cluster_virtual_node_taints                        = optional(list(string), [])
    oke_cluster_virtual_node_tag_freeform_tags             = optional(map(string), {})
    oke_cluster_virtual_node_tag_defined_tags              = optional(map(any), {})
  }))
  default = {}
}

###############################################
# Variables for OKE Cluster Addon Module
###############################################

variable "oke_cluster_addon_map" {
  description = "Map of cluster addons to create, keyed by addon name."
  type = map(object({
    addon_name                                 = string
    oke_addon_remove_addon_resources_on_delete = optional(bool, false)
    oke_addon_configuration                    = optional(map(any), {})
    oke_addon_override_existing                = optional(bool, false)
    oke_addon_version                          = optional(string, null)
  }))
  default = {}
}

###############################################
# Variables for OKE Cluster Workload Mapping
###############################################

variable "oke_cluster_enable_cluster_workload_mapping" {
  description = "Whether to enable cluster workload mapping."
  type        = bool
  default     = false
}

variable "oke_cluster_workload_mapping_defined_tags" {
  description = "Defined tags for the cluster workload mapping."
  type        = map(any)
  default     = {}
}

variable "oke_cluster_workload_mapping_freeform_tags" {
  description = "Freeform tags for the cluster workload mapping."
  type        = map(string)
  default     = {}
}

variable "oke_cluster_workload_mapping_mapped_compartment_id" {
  description = "OCID of the compartment to map workloads to."
  type        = string
}

variable "oke_cluster_workload_mapping_namespace" {
  description = "Kubernetes namespace for workload mapping."
  type        = string
}

###############################################
# Variables for OKE Credential Rotation Management
###############################################

variable "oke_cluster_enable_credential_rotation_management" {
  description = "Whether to enable credential rotation management (start)."
  type        = bool
  default     = false
}

variable "oke_enable_credential_rotation_management" {
  description = "Whether to enable credential rotation management (complete)."
  type        = bool
  default     = false
}

variable "oke_cluster_credential_rotation_auto_completion_delay_duration" {
  description = "Auto-completion delay duration for credential rotation (e.g. 'PT30M')."
  type        = string
  default     = null
}

