# terraform-scaleway-database

## Usage

```hcl
module "database" {
  databases = {
    main = {
      node_type      = "DB-DEV-S"
      engine         = "PostgreSQL-11"
      is_ha_cluster  = true
      disable_backup = false
    }
  }
}
```
