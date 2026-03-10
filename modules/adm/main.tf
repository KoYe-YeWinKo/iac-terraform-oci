resource "oci_adm_knowledge_base" "knowledge_base" {
  compartment_id = var.adm_knowledge_base_compartment_id
  display_name   = var.adm_knowledge_base_display_name
  defined_tags   = var.adm_knowledge_base_defined_tags
  freeform_tags  = var.adm_knowledge_base_freeform_tags
}