module "oke" {
  source = "../../modules/oke"

  # Core cluster inputs
  oke_cluster_compartment_id     = var.oke_cluster_compartment_id
  oke_cluster_vcn_id             = var.oke_cluster_vcn_id
  oke_cluster_subnet_id          = var.oke_cluster_subnet_id
  oke_cluster_name               = var.oke_cluster_name
  oke_cluster_kubernetes_version = var.kubernetes_version

  # Additional cluster options
  oke_cluster_cni_type                       = var.oke_cluster_cni_type
  oke_cluster_is_image_policy_enabled        = var.oke_cluster_is_image_policy_enabled
  oke_cluster_is_pod_security_policy_enabled = var.oke_cluster_is_pod_security_policy_enabled
  oke_cluster_services_cidr                  = var.oke_cluster_services_cidr
  oke_cluster_pods_cidr                      = var.oke_cluster_pods_cidr
  oke_cluster_type                           = var.oke_cluster_type
  oke_cluster_is_oidc_auth_enabled           = var.oke_cluster_is_oidc_auth_enabled
  oke_cluster_service_lb_subnet_ids          = var.oke_cluster_service_lb_subnet_ids

  # Node pools (map)
  oke_cluster_node_pool_map = var.oke_cluster_node_pool_map

  # Tags (optional)
  oke_cluster_freeform_tags = var.oke_cluster_freeform_tags
  oke_cluster_defined_tags  = var.oke_cluster_defined_tags

  # Workload mapping (disabled by default)
  oke_cluster_enable_cluster_workload_mapping        = var.oke_cluster_enable_cluster_workload_mapping
  oke_cluster_workload_mapping_mapped_compartment_id = var.oke_cluster_workload_mapping_mapped_compartment_id
  oke_cluster_workload_mapping_namespace             = var.oke_cluster_workload_mapping_namespace
  oke_cluster_workload_mapping_freeform_tags         = var.oke_cluster_workload_mapping_freeform_tags
  oke_cluster_workload_mapping_defined_tags          = var.oke_cluster_workload_mapping_defined_tags
}
