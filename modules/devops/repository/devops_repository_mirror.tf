resource "oci_devops_repository_mirror" "devops_repository_mirror" {
  count = var.is_devops_repository_type_mirror ? 1 : 0

  repository_id = oci_devops_repository.devops_repository.id
}