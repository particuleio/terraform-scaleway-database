resource "scaleway_rdb_database" "this" {
  for_each    = var.databases
  instance_id = scaleway_rdb_instance.this[each.key].id
  name        = each.key
}

resource "scaleway_rdb_instance" "this" {
  for_each       = var.databases
  name           = each.value.name
  node_type      = lower(each.value.node_type)
  engine         = each.value.engine
  is_ha_cluster  = lookup(each.value, "is_ha_cluster", true)
  disable_backup = lookup(each.value, "disable_backup", false)
  tags           = lookup(each.value, "tags", [])
  settings       = lookup(each.value, "settings", {})
}
