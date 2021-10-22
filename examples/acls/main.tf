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

output "rdb" {
  value     = module.rdb.this
  sensitive = true
}
