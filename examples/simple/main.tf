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

output "rdb" {
  value     = module.rdb.this
  sensitive = true
}
