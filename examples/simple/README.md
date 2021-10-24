# Simple Example

Single Managed Database creation.

```hcl
module "rdb" {
  source = "../../"

  databases = {
    main = {
      name           = "test-simple-db"
      node_type      = "DB-DEV-S"
      engine         = "PostgreSQL-11"
      is_ha_cluster  = true
      disable_backup = false
    }
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rdb"></a> [rdb](#module\_rdb) | ../../ | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rdb"></a> [rdb](#output\_rdb) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
