provider "oci" {
  tenancy_ocid     = var.my_oci_tenancy_ocid
  user_ocid        = var.my_user_ocid
  fingerprint      = var.my_user_fingerprint
  private_key_path = var.my_user_private_key_path
  region           = var.my_oci_region
}
