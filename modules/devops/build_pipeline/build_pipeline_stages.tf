resource "oci_devops_build_pipeline_stage" "build_pipeline_stage" {
  for_each       = var.build_pipeline_stages
  build_pipeline_id = oci_devops_build_pipeline.build_pipeline.id
  display_name   = each.value.display_name
  stage_type     = each.value.stage_type
  description    = lookup(each.value, "description", null)
  freeform_tags  = lookup(each.value, "freeform_tags", {})
  defined_tags   = lookup(each.value, "defined_tags", {})
  
  dynamic "build_stage_predecessors" {
    for_each = lookup(each.value, "build_stage_predecessors", [])
    content {
      predecessor_build_pipeline_stage_id = build_stage_predecessors.value.predecessor_build_pipeline_stage_id
    }
  }

  dynamic "build_spec" {
    for_each = lookup(each.value, "build_spec", []) 
    content {
      type = build_spec.value.type
      content = build_spec.value.content
    }
  }
}