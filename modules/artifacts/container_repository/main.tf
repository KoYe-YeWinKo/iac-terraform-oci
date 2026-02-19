resource "oci_artifacts_container_configuration" "container_configuration" {
  is_repository_created_on_first_push = var.container_configuration_is_repository_created_on_first_push
  compartment_id                      = var.container_configuration_compartment_id
}

resource "oci_artifacts_container_repository" "container_repository" {
  for_each       = var.container_repository_map
  compartment_id = each.value.container_repository_compartment_id
  display_name   = each.value.container_repository_display_name
  defined_tags   = each.value.container_repository_defined_tags
  freeform_tags  = each.value.container_repository_freeform_tags
  is_immutable   = each.value.container_repository_is_immutable
  is_public      = each.value.container_repository_is_public
  readme {
    content = each.value.container_repository_readme_content
    format  = each.value.container_repository_readme_format
  }
}