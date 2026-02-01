resource "oci_containerengine_node_pool" "oke_node_pool" {
    for_each = var.node_pool_map

    cluster_id     = oci_containerengine_cluster.oke_cluster.id
    compartment_id = each.node_pool_compartment_id
    defined_tags   = each.node_pool_defined_tags
    freeform_tags  = each.node_pool_freeform_tags
    initial_node_labels = each.initial_node_labels
    kubernetes_version  = each.node_pool_kubernetes_version
    name               = each.node_pool_name
    node_config_details {
        is_pv_encryption_in_transit_enabled = each.is_pv_encryption_in_transit_enabled
        kms_key_id                         = each.node_pool_kms_key_id
        node_pool_network_option_details {
            cni_type = each.node_pool_cni_type
            max_pods_per_node = each.node_pool_max_pods_per_node
            pod_nsg_ids      = each.node_pool_pod_nsg_ids
            pod_subnet_ids   = each.node_pool_pod_subnet_ids
        }
        defined_tags = each.node_defined_tags
        freeform_tags = each.node_freeform_tags
        nsg_ids    = each.node_nsg_ids
        placement_configs {
            availability_domain = each.node_placement_availability_domain
            capacity_reservation_id = each.node_capacity_reservation_id
            fault_domain         = each.node_placement_fault_domain
            preemptible_instance_config {
                preemption_action {
                    is_perserve_boot_volume = each.preemptible_preserve_boot_volume
                    type                   = each.preemptible_action_type
                }
            }
            subnet_id       = each.node_placement_subnet_id
        }
        size = each.node_size
    }
    node_eviction_node_pool_settings {
        eviction_grace_duration = each.eviction_grace_duration
        is_force_action_after_grace_duration = each.is_force_action_after_grace_duration
        is_force_deletion_after_grace_duration = each.is_force_deletion_after_grace_duration
    }
    node_metadata = each.node_metadata
    node_pool_cycling_details {
        cycle_modes = each.node_cycle_modes
        is_node_cycling_enabled = each.is_node_cycling_enabled
        maximum_surge = each.node_cycle_maximum_surge
        maximum_unavailable = each.node_cycle_maximum_unavailable
    }
    node_shape = each.node_shape
    node_shape_config {
        memory_in_gbs = each.node_shape_memory_in_gbs
        ocpus        = each.node_shape_ocpus
    }
    node_source_details {
        boot_volume_size_in_gbs = each.node_boot_volume_size_in_gbs
        image_id                = each.node_image_id
        source_type             = each.node_source_type
    }
    ssh_public_keys = each.node_ssh_public_keys
}