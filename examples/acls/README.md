# ACLs Example

Single Managed Database creation with ACL support.

```hcl
module "rdb" {
  source = "../../"

  databases = {
    main = {
      name      = "test-simple-db"
      node_type = "DB-DEV-S"
      engine    = "PostgreSQL-11"
      acls = [
        {
          ip          = "1.2.3.4/32"
          description = "Specific ACL 1"
        },
        {
          ip          = "192.168.1.20/28"
          description = "Specific ACL 2"
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
