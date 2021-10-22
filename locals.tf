locals {
  user_configs = flatten([
    for database, config in local.databases : [
      for user in config.users : {
        database = database
        user     = user
      }
    ]
  ])
  acl_configs = flatten([
    for database, config in local.databases : [
      for acl in config.acls : {
        database = database
        rule     = acl
      }
    ]
  ])
  acls_by_database = {
    for index, config in local.acl_configs :
    "${config.database}_${index}" => config
  }
  user_by_database = {
    for config in local.user_configs :
    "${config.database}_${config.user.username}" => config
  }
  default_database = {
    name      = "default"
    node_type = "DB-DEV-S"
    users     = []
    settings  = {}
  }
  databases = {
    for database_name, config in var.databases :
    database_name => merge(local.default_database, config)
  }
}
