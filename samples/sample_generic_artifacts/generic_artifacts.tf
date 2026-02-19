module "generic_artifacts" {
  source = "../../modules/artifacts/generic_artifacts"

  artifacts_repository_compartment_id  = var.artifacts_repository_compartment_id
  artifacts_repository_display_name    = var.artifacts_repository_display_name
  artifacts_repository_description     = var.artifacts_repository_description
  artifacts_repository_is_immutable    = var.artifacts_repository_is_immutable
  artifacts_repository_repository_type = var.artifacts_repository_repository_type
  artifacts_repository_defined_tags    = var.artifacts_repository_defined_tags
  artifacts_repository_freeform_tags   = var.artifacts_repository_freeform_tags

  generic_artifact_content_map = var.generic_artifact_content_map
}