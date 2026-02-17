resource "oci_devops_project" "devops_project" {
  compartment_id = var.devops_project_compartment_id
  name           = var.devops_project_name
  description    = var.devops_project_description

  freeform_tags = var.devops_project_freeform_tags
  defined_tags  = var.devops_project_defined_tags

  notification_config {
    topic_id = var.devops_project_notification_topic_id
  }
}