resource "oci_ons_notification_subscription" "notification_subscription" {
  for_each       = var.notification_subscription_map
  compartment_id = each.value.notification_subscription_compartment_id
  protocol       = each.value.notification_subscription_protocol
  endpoint       = each.value.notification_subscription_endpoint
  topic_id       = oci_ons_notification_topic.notification_topic.id
  freeform_tags  = each.value.notification_subscription_freeform_tags
  defined_tags   = each.value.notification_subscription_defined_tags
}