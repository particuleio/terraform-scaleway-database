locals {
  user_configs = flatten([
    for database, config in var.databases : [
      for user in config.users : {
        database = database
        user     = user
      }
    ]
  ])
  user_by_database = {
    for config in local.user_configs :
    "${config.database}_${config.user.username}" => config
  }
  user_computed = {
    for identifier, config in local.user_by_database :
    config.database => config...
  }
}
