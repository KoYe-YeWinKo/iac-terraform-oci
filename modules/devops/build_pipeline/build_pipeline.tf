resource "oci_devops_build_pipeline" "build_pipeline" {
  compartment_id = var.build_pipeline_compartment_id
  display_name   = var.build_pipeline_display_name
  stages         = var.build_pipeline_stages
  freeform_tags  = var.freeform_tags
  defined_tags   = var.defined_tags
}