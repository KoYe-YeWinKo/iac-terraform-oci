resource "oci_containerengine_cluster" "oke_cluster" {
  cluster_pod_network_options {
    cni_type = var.cni_type
  }
  compartment_id = var.oke_cluster_compartment_id
  defined_tags   = var.oke_cluster_defined_tags
  endpoint_config {
    is_public_ip_enabled = var.oke_cluster_is_public_ip_enabled
    nsg_ids              = var.oke_cluster_nsg_ids
    subnet_id            = var.cluster_subnet_id
  }
  freeform_tags = var.oke_cluster_freeform_tags
  image_policy_config {
    is_policy_enabled = var.oke_is_image_policy_enabled
    key_details {
      kms_key_id = var.oke_cluster_image_policy_kms_key_id
    }
  }
  kms_key_id         = var.oke_cluster_kms_key_id
  kubernetes_version = var.oke_cluster_kubernetes_version
  name               = var.cluster_name
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = var.oke_cluster_is_kubernetes_dashboard_enabled
      is_tiller_enabled               = var.oke_cluster_is_tiller_enabled
    }
    admission_controller_options {
      is_pod_security_policy_enabled = var.is_pod_security_policy_enabled
    }
    ip_famillies = var.ip_famillies
    kubernetes_network_config {
      pod_cidr      = var.oke_cluster_pod_cidr
      services_cidr = var.services_cidr
    }
    open_id_connect_config {
      ca_certificate             = var.oke_cluster_oidc_ca_certificate
      client_id                  = var.oke_cluster_oidc_client_id
      configuration_file         = var.oke_cluster_oidc_configuration_file
      groups_claim               = var.oke_cluster_oidc_groups_claim
      groups_prefix              = var.oke_cluster_oidc_groups_prefix
      is_open_id_connect_enabled = var.oke_cluster_is_oidc_enabled
      issuer_url                 = var.oke_cluster_oidc_issuer_url
      required_claims {
        key   = var.oke_cluster_oidc_required_claims_key
        value = var.oke_cluster_oidc_required_claims_value
      }
      signing_algorithm = var.oke_cluster_oidc_signing_algorithm
      username_claim    = var.oke_cluster_oidc_username_claim
      username_prefix   = var.oke_cluster_oidc_username_prefix
    }
    open_id_connect_discovery {
      is_open_id_connect_discovery_enabled = var.oke_cluster_is_oidc_discovery_enabled
    }
    persistent_volume_config {
      defined_tags  = var.oke_cluster_persistent_volume_defined_tags
      freeform_tags = var.oke_cluster_persistent_volume_freeform_tags
    }
    service_lb_config {
      backend_nsg_ids = var.oke_cluster_service_lb_backend_nsg_ids
      defined_tags    = var.oke_cluster_service_lb_defined_tags
      freeform_tags   = var.oke_clusterservice_lb_freeform_tags
    }
    service_lb_subnet_ids = var.oke_cluster_service_lb_subnet_ids
  }
  type   = var.oke_cluster_type
  vcn_id = var.oke_cluster_vcn_id
}

resource "oci_containerengine_node_pool" "oke_node_pool" {
  for_each = var.oke_cluster_node_pool_map

  cluster_id          = oci_containerengine_cluster.oke_cluster.id
  compartment_id      = each.oke_cluster_node_pool_compartment_id
  defined_tags        = each.oke_cluster_node_pool_defined_tags
  freeform_tags       = each.oke_cluster_node_pool_freeform_tags
  initial_node_labels = each.oke_cluster_node_pool_initial_node_labels
  kubernetes_version  = each.oke_cluster_node_pool_kubernetes_version
  name                = each.oke_cluster_node_pool_name
  node_config_details {
    is_pv_encryption_in_transit_enabled = each.oke_cluster_node_pool_is_pv_encryption_in_transit_enabled
    kms_key_id                          = each.oke_cluster_node_pool_kms_key_id
    node_pool_network_option_details {
      cni_type          = each.oke_cluster_node_pool_cni_type
      max_pods_per_node = each.oke_cluster_node_pool_max_pods_per_node
      pod_nsg_ids       = each.oke_cluster_node_pool_pod_nsg_ids
      pod_subnet_ids    = each.oke_cluster_node_pool_pod_subnet_ids
    }
    defined_tags  = each.oke_cluster_node_pool_defined_tags
    freeform_tags = each.oke_cluster_node_pool_freeform_tags
    nsg_ids       = each.oke_cluster_node_pool_nsg_ids
    placement_configs {
      availability_domain     = each.oke_cluster_node_pool_node_placement_availability_domain
      capacity_reservation_id = each.oke_cluster_node_pool_node_capacity_reservation_id
      fault_domain            = each.oke_cluster_node_pool_node_placement_fault_domain
      preemptible_instance_config {
        preemption_action {
          is_perserve_boot_volume = each.oke_cluster_node_pool_node_preemptible_preserve_boot_volume
          type                    = each.oke_cluster_node_pool_node_preemptible_action_type
        }
      }
      subnet_id = each.oke_cluster_node_pool_node_subnet_id
    }
    size = each.oke_cluster_node_pool_node_size
  }
  node_eviction_node_pool_settings {
    eviction_grace_duration                = each.oke_cluster_node_pool_eviction_grace_duration
    is_force_action_after_grace_duration   = each.oke_cluster_node_pool_is_force_action_after_grace_duration
    is_force_deletion_after_grace_duration = each.oke_cluster_node_pool_is_force_deletion_after_grace_duration
  }
  node_metadata = each.oke_cluster_node_pool_metadata
  node_pool_cycling_details {
    cycle_modes             = each.oke_cluster_node_pool_cycle_modes
    is_node_cycling_enabled = each.oke_cluster_node_pool_is_node_cycling_enabled
    maximum_surge           = each.oke_cluster_node_pool_maximum_surge
    maximum_unavailable     = each.oke_cluster_node_pool_maximum_unavailable
  }
  node_shape = each.oke_cluster_node_pool_node_shape
  node_shape_config {
    memory_in_gbs = each.oke_cluster_node_pool_node_shape_memory_in_gbs
    ocpus         = each.oke_cluster_node_pool_node_shape_ocpus
  }
  node_source_details {
    boot_volume_size_in_gbs = each.oke_cluster_node_pool_boot_volume_size_in_gbs
    image_id                = each.oke_cluster_node_pool_image_id
    source_type             = each.oke_cluster_node_pool_source_type
  }
  ssh_public_keys = each.oke_cluster_node_pool_ssh_public_keys
}

resource "oci_containerengine_virtual_node_pool" "oke_virtual_node_pool" {
  for_each                    = var.virtual_node_pool_map
  cluster_id                  = oci_containerengine_cluster.oke_cluster.id
  compartment_id              = each.oke_cluster_virtual_node_pool_compartment_id
  defined_tags                = each.oke_cluster_virtual_node_pool_defined_tags
  display_name                = each.oke_cluster_virtual_node_pool_display_name
  freeform_tags               = each.oke_cluster_virtual_node_pool_freeform_tags
  initial_virtual_node_labels = each.oke_cluster_virtual_node_pool_initial_labels
  nsg_ids                     = each.oke_cluster_virtual_node_pool_nsg_ids
  placement_configs {
    availability_domain = each.oke_cluster_virtual_node_placement_availability_domain
    fault_domain        = each.oke_cluster_virtual_node_placement_fault_domain
    subnet_id           = each.oke_cluster_virtual_node_placement_subnet_id
  }
  pod_configuration {
    nsg_ids   = each.oke_cluster_virtual_node_pod_nsg_ids
    shape     = each.oke_cluster_virtual_node_pod_shape
    subnet_id = each.oke_cluster_virtual_node_pod_subnet_id
  }
  size   = each.oke_cluster_virtual_node_size
  taints = each.oke_cluster_virtual_node_taints
  virtual_node_tags {
    freeform_tags = each.oke_cluster_virtual_node_tag_freeform_tags
    defined_tags  = each.oke_cluster_virtual_node_tag_defined_tags
  }
}

resource "oci_containerengine_cluster_workload_mapping" "oke_cluster_workload_mapping" {
  count = var.oke_cluster_enable_cluster_workload_mapping ? 1 : 0

  cluster_id            = oci_containerengine_cluster.oke_cluster.id
  defined_tags          = var.oke_cluster_workload_mapping_defined_tags
  freeform_tags         = var.oke_cluster_workload_mapping_freeform_tags
  mapped_compartment_id = var.oke_cluster_workload_mapping_mapped_compartment_id
  namespace             = var.oke_cluster_workload_mapping_namespace
}

resource "oci_containerengine_cluster_start_credential_rotation_management" "oke_cluster_start_credential_rotation_management" {
  count = var.oke_cluster_enable_credential_rotation_management ? 1 : 0

  cluster_id                     = oci_containerengine_cluster.oke_cluster.id
  auto_completion_delay_duration = var.oke_cluster_credential_rotation_auto_completion_delay_duration
}

resource "oci_containerengine_cluster_complete_credential_rotation_management" "oke_cluster_credential_rotation_management" {
  count = var.oke_enable_credential_rotation_management ? 1 : 0

  cluster_id = oci_containerengine_cluster.oke_cluster.id
  depends_on = [oci_containerengine_cluster_start_credential_rotation_management.oke_cluster_start_credential_rotation_management]
}

resource "oci_containerengine_addon" "oke_cluster_addon" {
  for_each = var.oke_cluster_addon_map

  addon_name                       = each.value.addon_name
  cluster_id                       = oci_containerengine_cluster.oke_cluster.id
  remove_addon_resources_on_delete = each.value.oke_addon_remove_addon_resources_on_delete
  configuration                    = each.value.oke_addon_configuration
  override_existing                = each.oke_addon_override_existing
  version                          = each.oke_addon_version
}
