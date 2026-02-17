output "notification_topic_id" {
  description = "The OCID of the Notification Topic created for DevOps project."
  value       = oci_ons_notification_topic.notification_topic.id
}