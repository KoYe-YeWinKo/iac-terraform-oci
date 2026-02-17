module "devops_project" {
  source = "../../modules/devops/project"

  devops_project_compartment_id        = var.devops_project_compartment_id
  devops_project_name                  = var.devops_project_name
  devops_project_description           = var.devops_project_description
  devops_project_freeform_tags         = var.devops_project_freeform_tags
  devops_project_defined_tags          = var.devops_project_defined_tags
  devops_project_notification_topic_id = var.devops_project_notification_topic_id

  devops_project_repository_approval_rules_items                    = var.devops_project_repository_approval_rules_items
  devops_project_repository_merge_settings_allowed_merge_strategies = var.devops_project_repository_merge_settings_allowed_merge_strategies
  devops_project_repository_merge_settings_default_merge_strategy   = var.devops_project_repository_merge_settings_default_merge_strategy
}