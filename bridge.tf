 resource "routeros_interface_bridge" "bridge" {
   name           = "Management"
   admin_mac      = "08:55:31:5F:85:04"
 }

resource "routeros_interface_bridge_port" "bridge_ports" {
  for_each = {
    "ether2"       = { comment = "", pvid = "1" }
    "ether3"       = { comment = "Frodo", pvid = "1" }
    "ether4"       = { comment = "Gandalf", pvid = "1" }
    "ether5"       = { comment = "Bilbo", pvid = "1" }
    "wlan1"        = { comment = "", pvid = "1" }
    "wlan2"        = { comment = "", pvid = "1" }
  }
  bridge    = routeros_interface_bridge.bridge.name
  interface = each.key
  comment   = each.value.comment
  pvid      = each.value.pvid
}

import {
  for_each = {
    "ether2"       = { id = "*2" }
    "ether3"       = { id = "*7" }
    "ether4"       = { id = "*8" }
    "ether5"       = { id = "*9" }
    "wlan1"        = { id = "*3" }
    "wlan2"        = { id = "*4" }
  }
  to = routeros_interface_bridge_port.bridge_ports[each.key]
  id = each.value.id
}
