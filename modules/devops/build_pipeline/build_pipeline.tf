resource "oci_devops_build_pipeline" "build_pipeline" {
  display_name = var.build_pipeline_display_name
  project_id   = var.build_pipeline_project_id
  description  = var.build_pipeline_description

  build_pipeline_parameters {
    dynamic "items" {
      for_each = var.build_pipeline_parameters_items
      content {
        name          = items.value.name
        description   = lookup(items.value, "description", null)
        default_value = lookup(items.value, "default_value", null)
      }
    }
  }

  defined_tags  = var.build_pipeline_defined_tags
  freeform_tags = var.build_pipeline_freeform_tags

}