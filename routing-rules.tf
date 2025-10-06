
import {
  id = "*3"
  to = routeros_routing_rule.lan1-to-edw
}

resource "routeros_routing_rule" "lan1-to-edw" {
  src_address = "192.168.62.0/24"
  dst_address = "192.168.65.0/24"
  action      = "lookup"
  table       = routeros_routing_table.edw.name
}


import {
  id = "*4"
  to = routeros_routing_rule.lan2-to-edw
}
resource "routeros_routing_rule" "lan2-to-edw" {
  src_address = "192.168.11.0/24"
  dst_address = "192.168.65.0/24"
  action      = "lookup"
  table       = routeros_routing_table.edw.name
}




