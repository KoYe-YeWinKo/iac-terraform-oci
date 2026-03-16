variable "my_oci_tenancy_ocid" {
  description = "OCI tenancy OCID used for the provider"
  type        = string
}

variable "my_user_ocid" {
  description = "OCI user OCID used for the provider"
  type        = string
}

variable "my_user_fingerprint" {
  description = "Fingerprint for the API key"
  type        = string
}

variable "my_user_private_key_path" {
  description = "Path to the private key for OCI API auth"
  type        = string
}

variable "my_oci_region" {
  description = "OCI region"
  type        = string
}

variable "oke_cluster_compartment_id" {
  description = "Compartment OCID to create OKE resources in"
  type        = string
}

variable "oke_cluster_vcn_id" {
  description = "VCN OCID used by the cluster"
  type        = string
}

variable "oke_cluster_subnet_id" {
  description = "Subnet OCID for the cluster endpoint"
  type        = string
}

variable "oke_cluster_name" {
  description = "Name for the OKE cluster"
  type        = string
  default     = "example-oke-cluster"
}

variable "oke_cluster_cni_type" {
  description = "CNI type for cluster pod network options"
  type        = string
  default     = "OCI_VCN_IP_NATIVE"
}

variable "oke_cluster_is_image_policy_enabled" {
  description = "Enable image policy for the cluster"
  type        = bool
  default     = false
}

variable "oke_cluster_is_pod_security_policy_enabled" {
  description = "Enable Pod Security Policy admission controller"
  type        = bool
  default     = false
}

variable "oke_cluster_services_cidr" {
  description = "Services CIDR block for the cluster (optional)"
  type        = string
  default     = null
}

variable "oke_cluster_pods_cidr" {
  description = "Pods CIDR block for the cluster (optional)"
  type        = string
  default     = null
}

variable "oke_cluster_type" {
  description = "Cluster type (e.g., 'ENHANCED' for advanced features)"
  type        = string
  default     = null
}

variable "oke_cluster_is_oidc_auth_enabled" {
  description = "Whether OIDC authentication is enabled for the cluster"
  type        = bool
  default     = false
}

variable "kubernetes_version" {
  description = "Kubernetes version string (optional)"
  type        = string
  default     = null
}

variable "oke_cluster_node_pool_map" {
  description = "Map of node pools to create by the OKE module. See modules/oke/variables.tf for schema."
  type = map(object({
    oke_cluster_node_pool_name                                        = string
    oke_cluster_node_pool_node_shape                                  = string
    oke_cluster_node_pool_node_subnet_id                              = string
    oke_cluster_node_pool_freeform_tags                               = optional(map(string), {})
    oke_cluster_node_pool_defined_tags                                = optional(map(any), {})
    oke_cluster_node_pool_ssh_public_keys                             = optional(list(string), [])
    oke_cluster_node_pool_compartment_id                              = string
    oke_cluster_node_pool_node_size                                   = number
    oke_cluster_node_pool_node_placement_availability_domain          = string
    oke_cluster_node_pool_node_shape_memory_in_gbs                    = optional(number, null)
    oke_cluster_node_pool_node_shape_ocpus                            = optional(number, null)
    oke_cluster_node_pool_node_source_details_boot_volume_size_in_gbs = optional(number, null)
    oke_cluster_node_pool_node_source_details_image_id                = optional(string, null)
    oke_cluster_node_pool_node_source_details_source_type             = optional(string, null)
    oke_cluster_node_pool_pod_network_option_pod_subnet_ids           = list(string)
    oke_cluster_node_pool_node_shape_ocpus                            = optional(number, null)
    oke_cluster_node_pool_node_shape_memory_in_gbs                    = optional(number, null)
  }))
  default = {}
}

variable "oke_cluster_enable_cluster_workload_mapping" {
  description = "Whether to enable cluster workload mapping (sample default false)."
  type        = bool
  default     = false
}

variable "oke_cluster_workload_mapping_mapped_compartment_id" {
  description = "Mapped compartment OCID (optional)"
  type        = string
  default     = null
}

variable "oke_cluster_workload_mapping_namespace" {
  description = "Namespace for workload mapping (optional)"
  type        = string
  default     = null
}

variable "oke_cluster_workload_mapping_freeform_tags" {
  description = "Freeform tags for workload mapping"
  type        = map(string)
  default     = {}
}

variable "oke_cluster_workload_mapping_defined_tags" {
  description = "Defined tags for workload mapping"
  type        = map(any)
  default     = {}
}

variable "oke_cluster_freeform_tags" {
  description = "Freeform tags to apply"
  type        = map(string)
  default     = {}
}

variable "oke_cluster_defined_tags" {
  description = "Defined tags to apply"
  type        = map(any)
  default     = {}
}

variable "oke_cluster_service_lb_subnet_ids" {
  description = "List of subnet OCIDs for the cluster's service load balancer (optional)"
  type        = list(string)
  default     = []
}
