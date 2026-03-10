output "oke_cluster_id" {
  description = "The OCID of the OKE cluster."
  value       = oci_containerengine_cluster.oke_cluster.id
}