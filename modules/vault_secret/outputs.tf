output "vault_secret_ids" {
  description = "A map of vault secret OCIDs keyed by the arbitrary name defined in input variable"
  value       = { for k, v in oci_vault_secret.vault_secret : k => v.id }
}