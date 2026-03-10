variable "adm_knowledge_base_compartment_id" {
  description = "The OCID of the compartment where the knowledge base will be created."
  type        = string
}

variable "adm_knowledge_base_display_name" {
  description = "The display name of the knowledge base."
  type        = string
}

variable "adm_knowledge_base_defined_tags" {
  description = "Defined tags for the knowledge base. Each key is predefined and scoped to a namespace. For more information, see Resource Tags (https://docs.oracle.com/en-us/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
}

variable "adm_knowledge_base_freeform_tags" {
  description = "Free-form tags for the knowledge base. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see Resource Tags (https://docs.oracle.com/en-us/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
}
