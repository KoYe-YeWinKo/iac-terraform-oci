variable "oci_redis_cache_config_set_display_name" {
  description = "The display name of the cache config set."
  type        = string
}

variable "oci_redis_cache_config_set_description" {
  description = "The description of the cache config set."
  type        = string
}

variable "oci_redis_cache_config_set_defined_tags" {
  description = "Defined tags for the cache config set. Each key is predefined and scoped to a namespace. For more information, see Resource Tags (https://docs.oracle.com/en-us/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
}

variable "oci_redis_cache_config_set_freeform_tags" {
  description = "Free-form tags for the cache config set. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see Resource Tags (https://docs.oracle.com/en-us/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
}

variable "oci_redis_cache_config_set_software_version" {
  description = "The software version of the cache config set."
  type        = string
}

variable "oci_redis_redis_cluster_compartment_id" {
  description = "The OCID of the compartment where the Redis cluster will be created."
  type        = string
}

variable "oci_redis_redis_cluster_display_name" {
  description = "The display name of the Redis cluster."
  type        = string
}

variable "oci_redis_redis_cluster_defined_tags" {
  description = "Defined tags for the Redis cluster. Each key is predefined and scoped to a namespace. For more information, see Resource Tags (https://docs.oracle.com/en-us/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
}

variable "oci_redis_redis_cluster_freeform_tags" {
  description = "Free-form tags for the Redis cluster. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see Resource Tags (https://docs.oracle.com/en-us/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
}

variable "oci_redis_redis_cluster_cluster_mode" {
  description = "The cluster mode of the Redis cluster. Valid values are: SINGLE_NODE, ACTIVE_ACTIVE, and ACTIVE_STANDBY."
  type        = string
}

variable "oci_redis_redis_cluster_node_count" {
  description = "The number of nodes in the Redis cluster."
  type        = number
}

variable "oci_redis_redis_cluster_node_memory_in_gbs" {
  description = "The amount of memory in GBs for each node in the Redis cluster."
  type        = number
}

variable "oci_redis_redis_cluster_nsg_ids" {
  description = "The list of Network Security Group OCIDs associated with the Redis cluster."
  type        = list(string)
}

variable "oci_redis_redis_cluster_security_attribute" {
  description = "The security attribute of the Redis cluster. Valid values are: STANDARD and HIGH."
  type        = string
}
variable "oci_redis_redis_cluster_shard_count" {
  description = "The number of shards in the Redis cluster. Required if cluster_mode is ACTIVE_ACTIVE or ACTIVE_STANDBY."
  type        = number
}

variable "oci_redis_redis_cluster_software_version" {
  description = "The software version of the Redis cluster."
  type        = string
}

variable "oci_redis_redis_cluster_subnet_id" {
  description = "The subnet OCID for the Redis cluster."
  type        = string
}

variable "oci_redis_oci_cache_user_map" {
  description = "A map of cache users to create and attach to the Redis cluster. The key is an identifier for the user (not used in the resource itself) and the value is an object with the following properties: name (string, required), status (string, required), description (string, optional), defined_tags (map(string), optional), freeform_tags (map(string), optional), acl_strings (list(string), required), authentication_mode_authentication_type (string, required), authentication_mode_hashed_password (string, required)."
  type = map(object({
    name                                    = string
    status                                  = string
    description                             = optional(string, null)
    defined_tags                            = optional(map(string), {})
    freeform_tags                           = optional(map(string), {})
    acl_string                              = string
    authentication_mode_authentication_type = string
    authentication_mode_hashed_password     = string
  }))
  default = {}
}

variable "oci_redis_cache_config_set_configuration_details_items" {
  description = "A list of configuration details items for the cache config set. Each item is an object with the following properties: config_key (string, required) and config_value (string, required)."
  type = list(object({
    config_key   = string
    config_value = string
  }))
  default = []
}
