resource "scaleway_rdb_database" "this" {
  for_each    = local.databases
  instance_id = scaleway_rdb_instance.this[each.key].id
  name        = each.key
}

resource "scaleway_rdb_instance" "this" {
  for_each = local.databases

  name      = each.value.name
  node_type = lower(each.value.node_type)

  engine   = each.value.engine
  settings = lookup(each.value, "settings", {})

  user_name = lookup(each.value, "user_name", null)
  password  = lookup(each.value, "password", null)

  is_ha_cluster  = lookup(each.value, "is_ha_cluster", true)
  disable_backup = lookup(each.value, "disable_backup", false)

  volume_type       = lookup(each.value, "volume_type", "lssd")
  volume_size_in_gb = lookup(each.value, "volume_size_in_gb", null)

  region     = lookup(each.value, "region", null)
  project_id = lookup(each.value, "project_id", null)

  tags = lookup(each.value, "tags", [])
}
