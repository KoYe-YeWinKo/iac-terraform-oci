output "kms_vault_id" {
  description = "The OCID of the KMS vault"
  value       = oci_kms_vault.kms_vault.id
}

output "kms_key_ids" {
  description = "A map of KMS key OCIDs keyed by the arbitrary name defined in input variable"
  value       = { for k, v in oci_kms_key.kms_key : k => v.id }
}