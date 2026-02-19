resource "oci_devops_deploy_pipeline" "deploy_pipeline" {
  display_name  = var.deploy_pipeline_display_name
  project_id    = var.deploy_pipeline_project_id
  description   = var.deploy_pipeline_description
  defined_tags  = var.deploy_pipeline_defined_tags
  freeform_tags = var.deploy_pipeline_freeform_tags

  dynamic "deploy_pipeline_parameters" {
    for_each = length(var.deploy_pipeline_parameters) > 0 ? [var.deploy_pipeline_parameters] : []
    content {
      dynamic "items" {
        for_each = deploy_pipeline_parameters.value
        content {
          name          = items.value.name
          description   = lookup(items.value, "description", null)
          default_value = lookup(items.value, "default_value", null)
        }
      }
    }
  }
}