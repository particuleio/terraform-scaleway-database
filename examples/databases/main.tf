module "rdb" {
  source = "../../"

  databases = {
    main = {
      name      = "database-with-multiple-dbs"
      node_type = "DB-DEV-S"
      engine    = "PostgreSQL-11"
      dbs = [
        "default",
        "admin",
        "internal",
      ]
    }
  }
}

output "rdb" {
  value     = module.rdb.this
  sensitive = true
}
