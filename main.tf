resource "scaleway_rdb_instance" "this" {
  for_each = local.databases

  name      = each.value.name
  node_type = lower(each.value.node_type)

  engine   = each.value.engine
  settings = lookup(each.value, "settings", {})

  user_name = lookup(each.value, "user_name", null)
  password  = lookup(each.value, "password", null)

  is_ha_cluster = lookup(each.value, "is_ha_cluster", true)

  disable_backup            = lookup(each.value, "disable_backup", false)
  backup_schedule_frequency = lookup(each.value, "backup_schedule_frequency", null)
  backup_schedule_retention = lookup(each.value, "backup_schedule_retention", null)

  volume_type       = lookup(each.value, "volume_type", "lssd")
  volume_size_in_gb = lookup(each.value, "volume_size_in_gb", null)

  region     = lookup(each.value, "region", null)
  project_id = lookup(each.value, "project_id", null)

  tags = lookup(each.value, "tags", [])

  dynamic "private_network" {
    for_each = lookup(each.value, "private_network", {}) != {} ? [1] : []

    content {
      ip_net = lookup(each.value.private_networking, "ip_net", null)
      pn_id  = lookup(each.value.private_networking, "pn_id", null)
    }
  }
}
