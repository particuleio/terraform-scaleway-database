output "this" {
  value = {
    for name in keys(var.databases) : name => {
      "instance" = scaleway_rdb_instance.this[name],
      "database" = scaleway_rdb_database.this[name],
    }
  }
  description = "A map of the scaleway_rdb_database and scaleway_rdb_instance resources grouped by databases definitions"
}
