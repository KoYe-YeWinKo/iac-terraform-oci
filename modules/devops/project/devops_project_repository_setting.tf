resource "oci_devops_project_repository_setting" "devops_project_repository_setting" {
  project_id = oci_devops_project.devops_project.id
  approval_rules {
    items = var.devops_project_repository_approval_rules_items
  }

  merge_settings {
    allow_merge_strategies = var.devops_project_repository_merge_settings_allow_merge_strategies
    default_merge_strategy = var.devops_project_repository_merge_settings_default_merge_strategy
  }
}