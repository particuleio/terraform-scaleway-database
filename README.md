# terraform-scaleway-database

[![terraform-scaleway-database](https://github.com/particuleio/terraform-scaleway-database/actions/workflows/terraform.yml/badge.svg?branch=main)](https://github.com/particuleio/terraform-scaleway-database/actions/workflows/terraform.yml)

Terraform module to create Databases using Scaleway's [Managed Databases][scw-db].

Create and configure the following:
- Managed RDB Instances
- Database Users
- Database ACLs
- Managed Databases

[scw-db]: https://www.scaleway.com/en/database/

## Usage

The module takes a `map` of objects for each database to configure.

```hcl
# example with a single RDB instance configured with 2 managed databases
module "database" {
  source  = "particuleio/database/scaleway"
  version = "1.2.0"  # use latest version

  databases = {
    main = {
      node_type      = "DB-DEV-S"
      engine         = "PostgreSQL-11"

      dbs = ["default", "core"]
    }
  }
}
```

The `locals.tf` defines default values that are merged and overriden
by each `database` definition in the `databases` `map`.

### Examples

Multiple examples are available in the [`./examples`](./examples) directory.

- [A simple database setup](./examples/simple/)
- [Multiple database creation with users](./examples/users/)
- [Database creation with ACL support](./examples/acls/)
- [RDB instance with multiple databases](./examples/databases/)

Below is an advanced usage of this module.

```hcl
module "database" {
  source  = "particuleio/database/scaleway"
  version = "1.2.0"  # use latest version

  databases = {
    main = {
      name      = "database-with-multiple-dbs"
      node_type = "DB-DEV-S"
      engine    = "PostgreSQL-11"

      dbs = ["default", "admin", "internal"]

      acls = [
        {
          ip          = "1.2.3.4/32"
          description = "Specific ACL 1"
        },
        {
          ip          = "192.168.1.20/28"
          description = "Specific ACL 2"
        },
      ]

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
        },
      ]
    }
    metrics = {  # second RDB instance definition
      name      = "simple-database"
      node_type = "DB-DEV-S"
      engine    = "PostgreSQL-11"
    }
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [scaleway_rdb_acl.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/rdb_acl) | resource |
| [scaleway_rdb_database.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/rdb_database) | resource |
| [scaleway_rdb_instance.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/rdb_instance) | resource |
| [scaleway_rdb_user.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/rdb_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databases"></a> [databases](#input\_databases) | The scaleway Database configurations | `map(any)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region to be used with the scaleway provider | `string` | `"fr-par"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone to be used with the scaleway provider | `string` | `"fr-par-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | A map of the scaleway\_rdb\_database (including their users) and scaleway\_rdb\_instance resources grouped by databases definitions |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
