resource "oci_devops_build_pipeline" "build_pipeline" {
  display_name  = var.build_pipeline_display_name
  project_id    = var.build_pipeline_project_id
  description   = var.build_pipeline_description
  defined_tags  = var.build_pipeline_defined_tags
  freeform_tags = var.build_pipeline_freeform_tags

  dynamic "build_pipeline_parameters" {
    for_each = length(var.build_pipeline_parameters) > 0 ? [var.build_pipeline_parameters] : []
    content {
      dynamic "items" {
        for_each = build_pipeline_parameters.value
        content {
          name          = items.value.name
          description   = lookup(items.value, "description", null)
          default_value = lookup(items.value, "default_value", null)
        }
      }
    }
  }
}
