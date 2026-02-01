resource "oci_containerengine_cluster_workload_mapping" "oke_cluster_workload_mapping" {
  count = var.enable_cluster_workload_mapping ? 1 : 0

  cluster_id        = oci_containerengine_cluster.oke_cluster.id
  defined_tags    = var.cluster_workload_mapping_defined_tags
  freeform_tags   = var.cluster_workload_mapping_freeform_tags
  mapped_compartment_id = var.cluster_workload_mapping_mapped_compartment_id
  namespace = var.cluster_workload_mapping_namespace
}