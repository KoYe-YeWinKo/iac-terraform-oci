module "notification_topic" {
  source = "../../modules/nitification"

  notification_topic_compartment_id = var.notification_compartment_id
  notification_topic_name           = var.notification_topic_name
  notification_topic_description    = var.notification_topic_description
  notification_topic_freeform_tags  = var.notification_topic_freeform_tags
  notification_topic_defined_tags   = var.notification_topic_defined_tags
  notification_subscription_map     = var.notification_subscription_map
}