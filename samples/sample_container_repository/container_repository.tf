module "container_repository" {
  source                                                      = "../../modules/artifacts/container_repository"
  container_configuration_is_repository_created_on_first_push = var.container_configuration_is_repository_created_on_first_push
  container_configuration_compartment_id                      = var.container_configuration_compartment_id
  container_repository_map                                    = var.container_repository_map
}