###############################################
# Variables for OKE Cluster Module
###############################################
variable "cni_type" {
  description = "CNI type for cluster pod network options."
  type        = string
  default     = "OCI_VCN_IP_NATIVE"
}

variable "cluster_compartment_id" {
  description = "Compartment OCID for the cluster."
  type        = string
}

variable "cluster_defined_tags" {
  description = "Defined tags for the cluster."
  type        = map(any)
  default     = {}
}

variable "is_public_ip_enabled" {
  description = "Whether the cluster endpoint uses a public IP."
  type        = bool
  default     = false
}

variable "cluster_nsg_ids" {
  description = "Network Security Group OCIDs for the cluster endpoint."
  type        = list(string)
  default     = []
}

variable "cluster_subnet_id" {
  description = "Subnet OCID for the cluster endpoint."
  type        = string
}

variable "cluster_freeform_tags" {
  description = "Freeform tags for the cluster."
  type        = map(string)
  default     = {}
}

variable "is_image_policy_enabled" {
  description = "Enable image policy for the cluster."
  type        = bool
  default     = false
}

variable "image_policy_kms_key_id" {
  description = "KMS key OCID used by image policy."
  type        = string
  default     = null
}

variable "cluster_kms_key_id" {
  description = "KMS key OCID for the cluster."
  type        = string
  default     = null
}

variable "kubernetes_version" {
  description = "Kubernetes version for the cluster (e.g. 'v1.25.4')."
  type        = string
  default     = null
}

variable "cluster_name" {
  description = "Name for the cluster."
  type        = string
}

variable "is_kubernetes_dashboard_enabled" {
  description = "Enable Kubernetes dashboard add-on."
  type        = bool
  default     = false
}

variable "is_tiller_enabled" {
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

variable "pod_cidr" {
  description = "Pod CIDR block for the cluster (optional)."
  type        = string
  default     = null
}

variable "services_cidr" {
  description = "Services CIDR block for the cluster (optional)."
  type        = string
  default     = null
}

variable "oidc_ca_certificate" {
  description = "OIDC CA certificate (optional)."
  type        = string
  default     = null
}

variable "oidc_client_id" {
  description = "OIDC client id (optional)."
  type        = string
  default     = null
}

variable "oidc_configuration_file" {
  description = "OIDC configuration file (optional)."
  type        = string
  default     = null
}

variable "oidc_groups_claim" {
  description = "OIDC groups claim (optional)."
  type        = string
  default     = null
}

variable "oidc_groups_prefix" {
  description = "OIDC groups prefix (optional)."
  type        = string
  default     = null
}

variable "is_oidc_enabled" {
  description = "Whether OIDC is enabled for the cluster."
  type        = bool
  default     = false
}

variable "oidc_issuer_url" {
  description = "OIDC issuer URL (optional)."
  type        = string
  default     = null
}

variable "oidc_required_claims_key" {
  description = "Key for required OIDC claims (optional)."
  type        = string
  default     = null
}

variable "oidc_required_claims_value" {
  description = "Value for required OIDC claims (optional)."
  type        = string
  default     = null
}

variable "oidc_signing_algorithm" {
  description = "OIDC signing algorithm (optional)."
  type        = string
  default     = null
}

variable "oidc_username_claim" {
  description = "OIDC username claim (optional)."
  type        = string
  default     = null
}

variable "oidc_username_prefix" {
  description = "OIDC username prefix (optional)."
  type        = string
  default     = null
}

variable "is_oidc_discovery_enabled" {
  description = "Whether OIDC discovery is enabled."
  type        = bool
  default     = false
}

variable "pv_defined_tags" {
  description = "Defined tags for persistent volumes."
  type        = map(any)
  default     = {}
}

variable "pv_freeform_tags" {
  description = "Freeform tags for persistent volumes."
  type        = map(string)
  default     = {}
}

variable "service_lb_backend_nsg_ids" {
  description = "Backend NSG IDs for the service load balancer."
  type        = list(string)
  default     = []
}

variable "service_lb_defined_tags" {
  description = "Defined tags for the service load balancer."
  type        = map(any)
  default     = {}
}

variable "service_lb_freeform_tags" {
  description = "Freeform tags for the service load balancer."
  type        = map(string)
  default     = {}
}

variable "service_lb_subnet_ids" {
  description = "Subnet IDs for the service load balancer."
  type        = list(string)
  default     = []
}

variable "cluster_type" {
  description = "Cluster type (if required by the provider)."
  type        = string
  default     = null
}

variable "cluster_vcn_id" {
  description = "VCN OCID for the cluster."
  type        = string
}

###############################################
# Variables for OKE Node Pool Module
###############################################

variable "node_pool_map" {
  description = "Map of node pools to create, keyed by pool name."
  type = map(object({
    node_pool_compartment_id                  = string
    node_pool_defined_tags                    = optional(map(any), {})
    node_pool_freeform_tags                   = optional(map(string), {})
    initial_node_labels                       = optional(map(string), {})
    node_pool_kubernetes_version              = optional(string, null)
    node_pool_name                            = string
    is_pv_encryption_in_transit_enabled       = optional(bool, false)
    node_pool_kms_key_id                      = optional(string, null)
    node_pool_cni_type                        = optional(string, "OCI_VCN_IP_NATIVE")
    node_pool_max_pods_per_node               = optional(number, 31)
    node_pool_pod_nsg_ids                     = optional(list(string), [])
    node_pool_pod_subnet_ids                  = optional(list(string), [])
    node_defined_tags                         = optional(map(any), {})
    node_freeform_tags                        = optional(map(string), {})
    node_nsg_ids                              = optional(list(string), [])
    node_placement_availability_domain        = string
    node_capacity_reservation_id              = optional(string, null)
    node_placement_fault_domain               = optional(string, null)
    preemptible_preserve_boot_volume          = optional(bool, false)
    preemptible_action_type                   = optional(string, "TERMINATE")
    node_placement_subnet_id                  = string
    node_size                                 = number
    eviction_grace_duration                   = optional(string, null)
    is_force_action_after_grace_duration      = optional(bool, false)
    is_force_deletion_after_grace_duration    = optional(bool, false)
    node_metadata                             = optional(map(string), {})
    node_cycle_modes                          = optional(list(string), [])
    is_node_cycling_enabled                   = optional(bool, false)
    node_cycle_maximum_surge                  = optional(number, null)
    node_cycle_maximum_unavailable            = optional(number, null)
    node_shape                                = string
    node_shape_memory_in_gbs                  = optional(number, null)
    node_shape_ocpus                          = optional(number, null)
    node_boot_volume_size_in_gbs              = optional(number, 50)
    node_image_id                             = optional(string, null)
    node_source_type                          = optional(string, "IMAGE")
    node_ssh_public_keys                      = optional(list(string), [])
  }))
  default = {}
}

###############################################
# Variables for OKE Virtual Node Pool Module
###############################################

variable "virtual_node_pool_map" {
  description = "Map of virtual node pools to create, keyed by pool name."
  type = map(object({
    virtual_node_pool_compartment_id          = string
    virtual_node_pool_defined_tags            = optional(map(any), {})
    virtual_node_pool_display_name            = string
    virtual_node_pool_freeform_tags           = optional(map(string), {})
    virtual_node_initial_labels               = optional(map(string), {})
    virtual_node_nsg_ids                      = optional(list(string), [])
    virtual_node_placement_availability_domain = string
    virtual_node_placement_fault_domain       = optional(string, null)
    virtual_node_placement_subnet_id          = string
    virtual_node_pod_nsg_ids                  = optional(list(string), [])
    virtual_node_pod_shape                    = string
    virtual_node_pod_subnet_id                = string
    virtual_node_size                         = number
    virtual_node_taints                       = optional(list(string), [])
    virtual_node_tag_freeform_tags            = optional(map(string), {})
    virtual_node_tag_defined_tags             = optional(map(any), {})
  }))
  default = {}
}

###############################################
# Variables for OKE Cluster Addon Module
###############################################

variable "addon_map" {
  description = "Map of cluster addons to create, keyed by addon name."
  type = map(object({
    addon_name                       = string
    cluster_id                       = string
    remove_addon_resources_on_delete = optional(bool, false)
    addon_configuration              = optional(map(any), {})
    override_existing                = optional(bool, false)
    addon_version                    = optional(string, null)
  }))
  default = {}
}

###############################################
# Variables for OKE Cluster Workload Mapping
###############################################

variable "enable_cluster_workload_mapping" {
  description = "Whether to enable cluster workload mapping."
  type        = bool
  default     = false
}

variable "cluster_workload_mapping_defined_tags" {
  description = "Defined tags for the cluster workload mapping."
  type        = map(any)
  default     = {}
}

variable "cluster_workload_mapping_freeform_tags" {
  description = "Freeform tags for the cluster workload mapping."
  type        = map(string)
  default     = {}
}

variable "cluster_workload_mapping_mapped_compartment_id" {
  description = "OCID of the compartment to map workloads to."
  type        = string
}

variable "cluster_workload_mapping_namespace" {
  description = "Kubernetes namespace for workload mapping."
  type        = string
}

###############################################
# Variables for OKE Credential Rotation Management
###############################################

variable "enable_credential_rotation_management" {
  description = "Whether to enable credential rotation management (both start and complete)."
  type        = bool
  default     = false
}

variable "credential_rotation_auto_completion_delay_duration" {
  description = "Auto-completion delay duration for credential rotation (e.g. 'PT30M')."
  type        = string
  default     = null
}

