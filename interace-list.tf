import {
  to = routeros_interface_list.WAN
  id = "*2000012"
}
resource "routeros_interface_list" "WAN" { name = "WAN" }

import {
  to = routeros_interface_list.LAN
  id = "*2000013"
}

resource "routeros_interface_list" "LAN" { name = "LAN" }

import {
  to = routeros_interface_list.MYLAN
  id = "*2000014"
}

resource "routeros_interface_list" "MYLAN" { name = "MYLAN" }

import {
  to = routeros_interface_list.OOB
  id = "*2000011"
}

resource "routeros_interface_list" "OOB" { name = "OOB" }
