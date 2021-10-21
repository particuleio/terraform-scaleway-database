output "this" {
  value = {
    for name in keys(var.databases) : name => {
      "instance" = scaleway_rdb_instance.this[name],
      "database" = scaleway_rdb_database.this[name],
      "users" = [
        for identifier, config in local.user_by_database : {
          "username" : config.user.username,
          "is_admin" : config.user.is_admin,
          "password" : random_password.this[identifier].result,
          "identifier" : identifier
        } if config.database == name
      ],
    }
  }
  description = "A map of the scaleway_rdb_database (including their users) and scaleway_rdb_instance resources grouped by databases definitions"
}
