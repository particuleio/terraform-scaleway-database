resource "scaleway_rdb_database" "this" {
  for_each = local.dbs_by_database

  instance_id = scaleway_rdb_instance.this[each.value.database].id
  name        = each.value.db
}
