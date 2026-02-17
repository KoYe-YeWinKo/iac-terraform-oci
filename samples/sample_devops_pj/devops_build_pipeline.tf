module "devops_build_pipeline" {
  source = "../../modules/devops/build_pipeline"

  build_pipeline_display_name = var.build_pipeline_display_name
  build_pipeline_project_id   = module.devops_project.devops_project_id
  build_pipeline_description  = var.build_pipeline_description

  build_pipeline_parameters_items = var.build_pipeline_parameters_items

  build_pipeline_defined_tags  = var.build_pipeline_defined_tags
  build_pipeline_freeform_tags = var.build_pipeline_freeform_tags

  build_pipeline_stages = var.build_pipeline_stages
}