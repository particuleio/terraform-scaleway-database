resource "scaleway_rdb_acl" "this" {
  for_each = { for database, config in local.databases : database => config if length(config.acls) > 0 }

  instance_id = scaleway_rdb_instance.this[each.key].id

  dynamic "acl_rules" {
    for_each = each.value.acls

    content {
      ip          = acl_rules.value["ip"]
      description = acl_rules.value["description"]
    }
  }
}
