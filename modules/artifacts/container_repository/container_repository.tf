resource "oci_artifacts_container_repository" "container_repository" {
  compartment_id = var.container_repository_compartment_id
  display_name   = var.container_repository_display_name
  defined_tags   = var.container_repository_defined_tags
  freeform_tags  = var.container_repository_freeform_tags
  is_immutable   = var.container_repository_is_immutable
  is_public      = var.container_repository_is_public
  readme {
    content = var.container_repository_readme_content
    format  = var.container_repository_readme_format
  }
}