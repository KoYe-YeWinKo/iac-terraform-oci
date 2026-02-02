resource "oci_containerengine_cluster" "oke_cluster" {
  cluster_pod_network_options {
    cni_type = var.cni_type
  }
  compartment_id = var.oke_cluster_compartment_id
  defined_tags   = var.oke_cluster_defined_tags
  endpoint_config {
    is_public_ip_enabled = var.oke_cluster_is_public_ip_enabled
    nsg_ids              = var.oke_cluster_nsg_ids
    subnet_id            = var.cluster_subnet_id
  }
  freeform_tags = var.oke_cluster_freeform_tags
  image_policy_config {
    is_policy_enabled = var.oke_is_image_policy_enabled
    key_details {
      kms_key_id = var.oke_cluster_image_policy_kms_key_id
    }
  }
  kms_key_id         = var.oke_cluster_kms_key_id
  kubernetes_version = var.oke_cluster_kubernetes_version
  name               = var.cluster_name
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = var.oke_cluster_is_kubernetes_dashboard_enabled
      is_tiller_enabled               = var.oke_cluster_is_tiller_enabled
    }
    admission_controller_options {
      is_pod_security_policy_enabled = var.is_pod_security_policy_enabled
    }
    ip_famillies = var.ip_famillies
    kubernetes_network_config {
      pod_cidr      = var.oke_cluster_pod_cidr
      services_cidr = var.services_cidr
    }
    open_id_connect_config {
      ca_certificate             = var.oke_cluster_oidc_ca_certificate
      client_id                  = var.oke_cluster_oidc_client_id
      configuration_file         = var.oke_cluster_oidc_configuration_file
      groups_claim               = var.oke_cluster_oidc_groups_claim
      groups_prefix              = var.oke_cluster_oidc_groups_prefix
      is_open_id_connect_enabled = var.oke_cluster_is_oidc_enabled
      issuer_url                 = var.oke_cluster_oidc_issuer_url
      required_claims {
        key   = var.oke_cluster_oidc_required_claims_key
        value = var.oke_cluster_oidc_required_claims_value
      }
      signing_algorithm = var.oke_cluster_oidc_signing_algorithm
      username_claim    = var.oke_cluster_oidc_username_claim
      username_prefix   = var.oke_cluster_oidc_username_prefix
    }
    open_id_connect_discovery {
      is_open_id_connect_discovery_enabled = var.oke_cluster_is_oidc_discovery_enabled
    }
    persistent_volume_config {
      defined_tags  = var.oke_cluster_persistent_volume_defined_tags
      freeform_tags = var.oke_cluster_persistent_volume_freeform_tags
    }
    service_lb_config {
      backend_nsg_ids = var.oke_cluster_service_lb_backend_nsg_ids
      defined_tags    = var.oke_cluster_service_lb_defined_tags
      freeform_tags   = var.oke_clusterservice_lb_freeform_tags
    }
    service_lb_subnet_ids = var.oke_cluster_service_lb_subnet_ids
  }
  type   = var.oke_cluster_type
  vcn_id = var.oke_cluster_vcn_id
}