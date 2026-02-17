resource "oci_devops_repository" "devops_repository" {
  project_id           = var.devops_repository_project_id
  name                 = var.devops_repository_name
  description          = var.devops_repository_description
  repository_type      = var.devops_repository_repository_type
  parent_repository_id = var.devops_repository_parent_repository_id
  default_branch       = var.devops_repository_default_branch
  freeform_tags        = var.devops_repository_freeform_tags
  defined_tags         = var.devops_repository_defined_tags
  dynamic "mirror_repository_config" {
    for_each = var.is_devops_repository_type_mirror ? [1] : []
    content {
      connector_id   = var.devops_repository_mirror_repository_config_connector_id
      repository_url = var.devops_repository_mirror_repository_config_repository_url
      dynamic "trigger_schedule" {
        for_each = var.devops_repository_mirror_repository_config_schedule_type != null ? [1] : []
        content {
          custom_schedule = var.devops_repository_mirror_repository_config_custom_schedule
          schedule_type   = var.devops_repository_mirror_repository_config_schedule_type
        }
      }
    }
  }
  #lifecycle {
  #  ignore_changes = [
  #  default_branch
  #  ]
  #}
}
