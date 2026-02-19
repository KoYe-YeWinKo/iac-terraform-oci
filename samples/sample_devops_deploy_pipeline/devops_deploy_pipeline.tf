module "devops_deploy_pipeline" {
  source = "../../modules/devops/deploy_pipeline"

  deploy_pipeline_display_name  = var.deploy_pipeline_display_name
  deploy_pipeline_project_id    = var.deploy_pipeline_project_id
  deploy_pipeline_description   = var.deploy_pipeline_description
  deploy_pipeline_parameters    = var.deploy_pipeline_parameters
  deploy_pipeline_defined_tags  = var.deploy_pipeline_defined_tags
  deploy_pipeline_freeform_tags = var.deploy_pipeline_freeform_tags

  # Optional: Uncomment and provide stage details to create stages within the deployment pipeline.
  #deploy_pipeline_stages = var.deploy_pipeline_stages
}