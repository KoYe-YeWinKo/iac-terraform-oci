resource "oci_redis_cache_config_set" "cache_config_set" {
  compartment_id   = var.ooci_redis_redis_cluster_compartment_id
  display_name     = var.oci_redis_cache_config_set_display_name
  description      = var.oci_redis_cache_config_set_description
  defined_tags     = var.oci_redis_cache_config_set_defined_tags
  freeform_tags    = var.oci_redis_cache_config_set_freeform_tags
  software_version = var.oci_redis_cache_config_set_software_version

  configuration_details {
    dynamic "items" {
      for_each = var.oci_redis_cache_config_set_configuration_details_items
      content {
        config_key   = items.config_key
        config_value = items.config_value
      }
    }
  }
}

resource "oci_redis_redis_cluster" "redis_cluster" {
  compartment_id = var.oci_redis_redis_cluster_compartment_id
  display_name   = var.oci_redis_redis_cluster_display_name
  defined_tags   = var.oci_redis_redis_cluster_defined_tags
  freeform_tags  = var.oci_redis_redis_cluster_freeform_tags

  cluster_mode            = var.oci_redis_redis_cluster_cluster_mode
  node_count              = var.oci_redis_redis_cluster_node_count
  node_memory_in_gbs      = var.oci_redis_redis_cluster_node_memory_in_gbs
  nsg_ids                 = var.oci_redis_redis_cluster_nsg_ids
  oci_cache_config_set_id = oci_redis_cache_config_set.cache_config_set.id
  security_attribute      = var.oci_redis_redis_cluster_security_attribute
  shard_count             = var.oci_redis_redis_cluster_shard_count
  software_version        = var.oci_redis_redis_cluster_software_version
  subnet_id               = var.oci_redis_redis_cluster_subnet_id
}

resource "oci_redis_oci_cache_user" "cache_users" {
  for_each = var.oci_redis_oci_cache_user_map

  compartment_id = var.oci_redis_redis_cluster_compartment_id
  name           = each.value.name
  status         = each.value.status
  description    = each.value.description
  defined_tags   = each.value.defined_tags
  freeform_tags  = each.value.freeform_tags

  acl_string = each.value.acl_string
  authentication_mode {
    authentication_type = each.value.authentication_mode_authentication_type
    hashed_password     = each.value.authentication_mode_hashed_password
  }
}

resource "oci_redis_redis_cluster_attach_oci_cache_user" "attach_cache_users" {
  oci_cache_users  = [for cache_user in oci_redis_oci_cache_user.cache_users : cache_user.id]
  redis_cluster_id = oci_redis_redis_cluster.redis_cluster.id
}