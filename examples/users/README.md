# Users Example

Managed Database creation with user support.

```hcl
module "rdb" {
  source = "../../"

  databases = {
    main = {
      name      = "test-simple-db"
      node_type = "DB-DEV-S"
      engine    = "PostgreSQL-11"
      users = [
        {
          username        = "application"
          password_length = 16
          is_admin        = false
        },
        {
          username        = "administrator"
          password_length = 24
          is_admin        = true
        }
      ]
    }
    secondary = {
      name      = "test-simple-db"
      node_type = "DB-DEV-S"
      engine    = "PostgreSQL-11"
      users = [
        {
          password_length = 16
          is_admin        = false
          username        = "test1"
        }
      ]
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
| <a name="module_rdb"></a> [rdb](#module\_rdb) | ../../ |  |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rdb"></a> [rdb](#output\_rdb) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
