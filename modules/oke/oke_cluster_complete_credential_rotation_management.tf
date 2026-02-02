resource "oci_containerengine_cluster_complete_credential_rotation_management" "oke_cluster_credential_rotation_management" {
  count = var.oke_enable_credential_rotation_management ? 1 : 0

  cluster_id = oci_containerengine_cluster.oke_cluster.id
  depends_on = [oci_containerengine_cluster_start_credential_rotation_management.oke_cluster_start_credential_rotation_management]
}