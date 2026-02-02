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