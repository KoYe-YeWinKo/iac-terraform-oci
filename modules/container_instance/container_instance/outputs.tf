output "container_instance_ocid" {
  description = "OCID of the container instance"
  value       = oci_containerinstances_container_instance.this.id
}

output "container_instance_display_name" {
  description = "Display name of the container instance (if available)"
  value       = try(oci_containerinstances_container_instance.this.display_name, null)
}
