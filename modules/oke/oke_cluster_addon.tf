resource "oci_containerengine_addon" "oke_cluster_addon" {
  for_each = var.oke_cluster_addon_map

  addon_name                       = each.value.addon_name
  cluster_id                       = oci_containerengine_cluster.oke_cluster.id
  remove_addon_resources_on_delete = each.value.oke_addon_remove_addon_resources_on_delete
  configuration                    = each.value.oke_addon_configuration
  override_existing                = each.oke_addon_override_existing
  version                          = each.oke_addon_version
}
