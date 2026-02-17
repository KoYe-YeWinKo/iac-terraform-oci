resource "oci_devops_project_repository_setting" "devops_project_repository_setting" {
  project_id = oci_devops_project.devops_project.id
  approval_rules {
    dynamic "items" {
      for_each = var.devops_project_repository_approval_rules_items
      content {
        destination_branch  = items.value.destination_branch
        min_approvals_count = items.value.min_approvals_count
        name                = items.value.name
        dynamic "reviewers" {
          for_each = items.value.reviewers
          content {
            principal_id = reviewers.value.principal_id
          }
        }
      }
    }
  }
  merge_settings {
    allowed_merge_strategies = var.devops_project_repository_merge_settings_allowed_merge_strategies
    default_merge_strategy   = var.devops_project_repository_merge_settings_default_merge_strategy
  }
}