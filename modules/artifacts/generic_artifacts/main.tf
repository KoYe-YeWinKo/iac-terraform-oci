resource "oci_artifacts_repository" "repository" {
  compartment_id  = var.artifacts_repository_compartment_id
  display_name    = var.artifacts_repository_display_name
  description     = var.artifacts_repository_description
  is_immutable    = var.artifacts_repository_is_immutable
  repository_type = var.artifacts_repository_repository_type
  defined_tags    = var.artifacts_repository_defined_tags
  freeform_tags   = var.artifacts_repository_freeform_tags
}

resource "oci_artifacts_generic_artifact" "generic_artifact" {
  for_each      = oci_generic_artifacts_content_artifact_by_path.generic_artifacts_content
  artifact_id   = each.value.id
  defined_tags  = each.value.defined_tags
  freeform_tags = each.value.freeform_tags
}

resource "oci_generic_artifacts_content_artifact_by_path" "generic_artifacts_content" {
  for_each      = var.generic_artifact_content_map
  artifact_path = each.value.generic_artifact_artifact_path
  version       = each.value.generic_artifact_content_version
  repository_id = oci_artifacts_repository.repository.id
  source        = each.value.generic_artifact_content_source
  content       = each.value.generic_artifact_content_content
}