###############################################
# Variables for Notification Module
###############################################

variable "notification_topic_compartment_id" {
  description = "Compartment OCID for the notification topic."
  type        = string
}

variable "notification_topic_name" {
  description = "Name for the notification topic."
  type        = string
}

variable "notification_topic_description" {
  description = "Description for the notification topic (optional)."
  type        = string
  default     = null
}

variable "notification_topic_freeform_tags" {
  description = "Freeform tags for the notification topic."
  type        = map(string)
  default     = {}
}

variable "notification_topic_defined_tags" {
  description = "Defined tags for the notification topic."
  type        = map(any)
  default     = {}
}

variable "notification_subscription_map" {
  description = "Map of notification subscriptions to create, keyed by subscription name."
  type = map(object({
    notification_subscription_compartment_id = string
    notification_subscription_protocol       = string
    notification_subscription_endpoint       = string
    notification_subscription_freeform_tags  = optional(map(string), {})
    notification_subscription_defined_tags   = optional(map(any), {})
  }))
  default = {}
}