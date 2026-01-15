resource "oci_devops_build_pipeline" "build_pipeline" {
  compartment_id = var.compartment_id
  display_name   = var.display_name
  stages         = var.stages
  freeform_tags  = var.freeform_tags
  defined_tags   = var.defined_tags
}