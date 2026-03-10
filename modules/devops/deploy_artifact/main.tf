resource "oci_devops_deploy_artifact" "deploy_artifact" {
  display_name  = var.devops_deploy_artifact_display_name
  project_id    = var.devops_deploy_artifact_project_id
  description   = var.devops_deploy_artifact_description
  defined_tags  = var.devops_deploy_artifact_defined_tags
  freeform_tags = var.devops_deploy_artifact_freeform_tags
  argument_substitution_mode = var.devops_deploy_artifact_argument_substitution_mode


  deploy_artifact_source {
    base64encodecontent = var.devops_deploy_artifact_source_base64encodedcontent
    chart_url              = var.devops_deploy_artifact_source_chart_url
    deploy_artifact_path = var.devops_deploy_artifact_source_deploy_artifact_path
    deploy_artifact_source_type = var.devops_deploy_artifact_source_deploy_artifact_source_type
    deploy_artifact_version = var.devops_deploy_artifact_source_deploy_artifact_version
    helm_verification_key_source {
        current_public_key = var.devops_deploy_artifact_source_helm_verification_key_source_current_public_key
        previous_public_key = var.devops_deploy_artifact_source_helm_verification_key_source_previous_public_key
        vault_secret_id = var.devops_deploy_artifact_source_helm_verification_key_source_vault_secret_id
        verification_key_source_type = var.devops_deploy_artifact_source_helm_verification_key_source_verification_key_source_type
    }
    image_digest = var.devops_deploy_artifact_source_image_digest
    image_url = var.devops_deploy_artifact_source_image_url
    repository_id = var.devops_deploy_artifact_source_repository_id
  }
}
