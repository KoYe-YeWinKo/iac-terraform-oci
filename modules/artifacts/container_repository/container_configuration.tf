resource "oci_artifacts_container_configuration" "container_configuration" {
  namespace                           = var.container_configuration_namespace
  is_repository_created_on_first_push = var.container_configuration_is_repository_created_on_first_push
}