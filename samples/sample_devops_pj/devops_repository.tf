module "devops_repository" {
  source = "../../modules/devops/repository"

  for_each                          = var.devops_repositories_map
  devops_repository_project_id      = module.devops_project.devops_project_id
  devops_repository_name            = each.value.devops_repository_name
  devops_repository_description     = each.value.devops_repository_description
  devops_repository_repository_type = each.value.devops_repository_repository_type
  devops_repository_default_branch  = each.value.devops_repository_default_branch
  devops_repository_freeform_tags   = each.value.devops_repository_freeform_tags
  devops_repository_defined_tags    = each.value.devops_repository_defined_tags
  is_devops_repository_type_mirror  = each.value.is_devops_repository_type_mirror
}