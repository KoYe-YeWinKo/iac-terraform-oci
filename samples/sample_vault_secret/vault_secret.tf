module "vault_secret" {
  source = "../../modules/vault_secret"

  vault_secret_map = var.vault_secret_map
}