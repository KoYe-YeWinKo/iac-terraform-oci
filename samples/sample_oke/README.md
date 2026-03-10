# Sample OKE usage

This sample shows how to call the `modules/oke` module to create an OKE cluster and a basic node pool.

Usage:

1. Copy `common.auto.tfvars_template` to `common.auto.tfvars` and fill your OCID values and region.
2. Optionally update `variables.tf` values (node pool map, availability domains, etc.).
3. From this folder run:

```bash
terraform init
terraform plan
terraform apply
```

Notes:
- `modules/oke` expects certain inputs — consult `modules/oke/variables.tf` for the full schema.
- The example node pool map uses placeholders; replace them with real OCIDs and AD names.
