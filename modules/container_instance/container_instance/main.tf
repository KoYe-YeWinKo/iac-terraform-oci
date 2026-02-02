resource "oci_container_instances_container_instance" "oci_container_instance" {
  availability_domain           = var.availability_domain
  compartment_id                = var.compartment_id
  container_restart_policy      = var.container_restart_policy
  containers                    = var.containers
  defined_tags                  = var.defined_tags
  display_name                  = var.display_name
  dns_config                    = var.dns_config
  fault_domain                  = var.fault_domain
  freeform_tags                 = var.freeform_tags
  gracefull_shutdown_in_seconds = var.gracefull_shutdown_in_seconds
  image_pull_secrets            = var.image_pull_secrets
  shape                         = var.shape
  shape_config                  = var.shape_config
  vnics                         = var.vnics
  volumes                       = var.volumes
  state                         = var.state
}