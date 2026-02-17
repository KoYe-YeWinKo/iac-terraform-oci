###############################################
# Sample variables for Notification (sample folder)
###############################################

variable "notification_topic_map" {
  description = "Map of notification topics to create (matches notification.auto.tfvars)."
  type = map(object({
    notification_topic_compartment_id = string
    notification_topic_name           = string
    notification_topic_description    = optional(string, "")
    notification_topic_freeform_tags  = optional(map(string), {})
    notification_topic_defined_tags   = optional(map(any), {})

    # Optional nested subscriptions for this topic
    notification_subscription_map = optional(map(object({
      notification_subscription_compartment_id = string
      notification_subscription_protocol       = string
      notification_subscription_endpoint       = string
      notification_subscription_freeform_tags  = optional(map(string), {})
      notification_subscription_defined_tags   = optional(map(any), {})
    })), {})
  }))
  default = {}
}

# Backward-compatible top-level subscription map (if you prefer top-level subscriptions)
variable "notification_subscription_map" {
  description = "Optional top-level map of notification subscriptions."
  type = map(object({
    notification_subscription_compartment_id = string
    notification_subscription_protocol       = string
    notification_subscription_endpoint       = string
    notification_subscription_freeform_tags  = optional(map(string), {})
    notification_subscription_defined_tags   = optional(map(any), {})
  }))
  default = {}
}

###############################################
# Provider variables (from common.tfvars)
###############################################
variable "my_oci_tenancy_ocid" {
  description = "OCI tenancy OCID used by the provider."
  type        = string
}

variable "my_user_ocid" {
  description = "OCI user OCID used by the provider."
  type        = string
}

variable "my_user_fingerprint" {
  description = "Fingerprint for the API key used by the provider."
  type        = string
}

variable "my_user_private_key_path" {
  description = "Path to the private key file used by the provider."
  type        = string
}

variable "my_oci_region" {
  description = "OCI region (e.g. 'ap-tokyo-1')."
  type        = string
}
