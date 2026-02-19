resource "oci_devops_deploy_environment" "deploy_environment" {
  display_name            = var.deploy_environment_display_name
  project_id              = var.deploy_environment_project_id
  description             = var.deploy_environment_description
  deploy_environment_type = var.deploy_environment_deploy_environment_type
  cluster_id              = var.deploy_environment_cluster_id
  dynamic "compute_instance_group_selectors" {
    for_each = length(var.deploy_environment_compute_instance_group_selectors) > 0 ? [var.deploy_environment_compute_instance_group_selectors] : []
    content {
      dynamic "items" {
        for_each = compute_instance_group_selectors.value
        content {
          selector_type        = items.value.selector_type
          compute_instance_ids = lookup(items.value, "compute_instance_ids", null)
          query                = lookup(items.value, "query", null)
          region               = lookup(items.value, "region", null)
        }
      }
    }
  }
  function_id = var.deploy_environment_function_id
  dynamic "network_channel" {
    for_each = var.is_oke_cluster_private_network ? [1] : []
    content {
      network_channel_type = var.deploy_environment_network_channel_type
      nsg_ids              = var.deploy_environment_network_channel_nsg_ids
      subnet_id            = var.deploy_environment_network_channel_subnet_id
    }
  }

  defined_tags  = var.deploy_environment_defined_tags
  freeform_tags = var.deploy_environment_freeform_tags

}