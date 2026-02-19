output "kms_vault_id" {
  description = "The OCID of the KMS vault"
  value       = module.vault.kms_vault_id
}

output "kms_key_ids" {
  description = "The OCID of the KMS key"
  value       = module.vault.kms_key_ids
}