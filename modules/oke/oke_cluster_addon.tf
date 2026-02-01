resource "oci_containerengine_addon" "oke_cluster_addon" {
  for_each = var.addon_map

  addon_name    = each.addon_name
  cluster_id    = each.cluster_id
  remove_addon_resources_on_delete = each.remove_addon_resources_on_delete
  configuration = each.addon_configuration
  override_existing = each.override_existing
  version = each.addon_version
}
