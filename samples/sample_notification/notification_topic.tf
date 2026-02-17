module "notification_topic" {
  source = "../../modules/notification"

  for_each                          = var.notification_topic_map
  notification_topic_compartment_id = each.value.notification_topic_compartment_id
  notification_topic_name           = each.value.notification_topic_name
  notification_topic_description    = each.value.notification_topic_description
  notification_topic_freeform_tags  = each.value.notification_topic_freeform_tags
  notification_topic_defined_tags   = each.value.notification_topic_defined_tags
  notification_subscription_map     = each.value.notification_subscription_map
}
