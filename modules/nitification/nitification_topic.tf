resource "oci_ons_notification_topic" "notification_topic" {
  compartment_id = var.notification_topic_compartment_id
  name           = var.notification_topic_name
  description    = var.notification_topic_description
  freeform_tags  = var.notification_topic_freeform_tags
  defined_tags   = var.notification_topic_defined_tags
}