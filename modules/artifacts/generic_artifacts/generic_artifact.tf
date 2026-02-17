resource "oci_artifacts_generic_artifact" "generic_artifact" {
  artifact_id   = oci_generic_artifacts_content_artifacts_by_path.generic_artifacts_content.id
  defined_tags  = var.generic_artifact_defined_tags
  freeform_tags = var.generic_artifact_freeform_tags
}