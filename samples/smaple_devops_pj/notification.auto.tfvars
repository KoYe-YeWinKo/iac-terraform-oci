# Common Variables
compartment_id = "ocid1.compartment.oc1..aaaaaaaaexamplecompartmentid"

# Notification Topic Configuration
notification_topic_compartment_id = "ocid1.compartment.oc1..aaaaaaaaexamplecompartmentid"
notification_topic_name           = "sample-notification-topic"
notification_topic_description    = "Sample notification topic for DevOps project"

notification_topic_freeform_tags = {
  Environment = "Development"
  Project     = "DevOps"
  Team        = "Platform"
}

notification_topic_defined_tags = {
  "Operations.CostCenter" = "Engineering"
}

# Notification Subscriptions Configuration
notification_subscription_map = {
  email_subscription = {
    notification_subscription_compartment_id = "ocid1.compartment.oc1..aaaaaaaaexamplecompartmentid"
    notification_subscription_protocol       = "EMAIL"
    notification_subscription_endpoint       = "devops-team@example.com"
    notification_subscription_freeform_tags = {
      Type = "Email"
    }
    notification_subscription_defined_tags = {}
  }

  slack_subscription = {
    notification_subscription_compartment_id = "ocid1.compartment.oc1..aaaaaaaaexamplecompartmentid"
    notification_subscription_protocol       = "HTTPS"
    notification_subscription_endpoint       = "https://hooks.slack.com/services/YOUR/WEBHOOK/URL"
    notification_subscription_freeform_tags = {
      Type = "Slack"
    }
    notification_subscription_defined_tags = {}
  }
}