output "vault_secret_ids" {
  description = "A map of vault secret OCIDs keyed by the arbitrary name defined in input variable"
  value       = module.vault_secret.vault_secret_ids
}   