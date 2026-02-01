resource "oci_containerengine_virtual_node_pool" "oke_virtual_node_pool" {
  for_each = var.virtual_node_pool_map


  cluster_id     = oci_containerengine_cluster.oke_cluster.id
  compartment_id = each.virtual_node_pool_compartment_id
  defined_tags   = each.virtual_node_pool_defined_tags
  display_name  = each.virtual_node_pool_display_name
  freeform_tags  = each.virtual_node_pool_freeform_tags
  initial_virtual_node_labels = each.virtual_node_initial_labels
  nsg_ids    = each.virtual_node_nsg_ids
  placement_configs {
    availability_domain = each.virtual_node_placement_availability_domain
    fault_domain        = each.virtual_node_placement_fault_domain
    subnet_id           = each.virtual_node_placement_subnet_id
  }
  pod_configuration {
    nsg_ids = each.virtual_node_pod_nsg_ids
    shape   = each.virtual_node_pod_shape
    subnet_id = each.virtual_node_pod_subnet_id
  }
  size = each.virtual_node_size
  taints = each.virtual_node_taints
  virtual_node_tags {
    freeform_tags = each.virtual_node_tag_freeform_tags
    defined_tags  = each.virtual_node_tag_defined_tags
  }
}