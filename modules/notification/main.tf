resource "oci_ons_notification_topic" "notification_topic" {
  compartment_id = var.notification_topic_compartment_id
  name           = var.notification_topic_name
  description    = var.notification_topic_description
  freeform_tags  = var.notification_topic_freeform_tags
  defined_tags   = var.notification_topic_defined_tags
}

resource "oci_ons_subscription" "notification_subscription" {
  for_each       = var.notification_subscription_map
  compartment_id = each.value.notification_subscription_compartment_id
  protocol       = each.value.notification_subscription_protocol
  endpoint       = each.value.notification_subscription_endpoint
  topic_id       = oci_ons_notification_topic.notification_topic.id
  freeform_tags  = each.value.notification_subscription_freeform_tags
  defined_tags   = each.value.notification_subscription_defined_tags
}