resource "oci_generic_artifacts_content_artifacts_by_path" "generic_artifacts_content" {
  artifact_path = var.generic_artifact_content_artifact_path
  version       = var.generic_artifact_content_version
  repository_id = oci_artifacts_repository.repository.id
  source        = var.generic_artifact_content_source
  content       = var.generic_artifact_content_content
  defined_tags  = var.generic_artifact_content_defined_tags
  freeform_tags = var.generic_artifact_content_freeform_tags
}