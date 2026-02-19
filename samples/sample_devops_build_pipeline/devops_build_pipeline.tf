module "devops_build_pipeline" {
  source = "../../modules/devops/build_pipeline"

  build_pipeline_display_name  = var.build_pipeline_display_name
  build_pipeline_project_id    = var.build_pipeline_project_id
  build_pipeline_description   = var.build_pipeline_description
  build_pipeline_parameters    = var.build_pipeline_parameters
  build_pipeline_defined_tags  = var.build_pipeline_defined_tags
  build_pipeline_freeform_tags = var.build_pipeline_freeform_tags
}
