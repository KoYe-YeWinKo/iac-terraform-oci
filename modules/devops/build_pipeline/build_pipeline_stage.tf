resource "oci_devops_build_pipeline_stage" "build_pipeline_stage" {
  for_each          = var.build_pipeline_stages
  build_pipeline_id = oci_devops_build_pipeline.build_pipeline.id
  display_name      = each.value.display_name
  description       = lookup(each.value, "description", null)
  freeform_tags     = lookup(each.value, "freeform_tags", {})
  defined_tags      = lookup(each.value, "defined_tags", {})

  build_pipeline_stage_predecessor_collection {
    items {

    }
  }

}