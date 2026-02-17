resource "oci_devops_connection" "devops_connection" {
  count = var.is_devops_repository_type_mirror ? 1 : 0

  access_token    = var.devops_connection_access_token
  app_password    = var.devops_connection_app_password
  base_url        = var.devops_connection_base_url
  connection_type = var.devops_connection_connection_type
  defined_tags    = var.devops_connection_defined_tags
  description     = var.devops_connection_description
  display_name    = var.devops_connection_display_name
  freeform_tags   = var.devops_connection_freeform_tags
  project_id      = var.devops_repository_project_id
}