resource "oci_artifacts_repository" "repository" {
  compartment_id  = var.artifacts_repository_compartment_id
  display_name    = var.artifacts_repository_display_name
  description     = var.artifacts_repository_description
  is_immutable    = var.artifacts_repository_is_immutable
  repository_type = var.artifacts_repository_repository_type
  defined_tags    = var.artifacts_repository_defined_tags
  freeform_tags   = var.artifacts_repository_freeform_tags
}