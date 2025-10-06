import {
  id = "*8000013B"
  to = routeros_ip_route.jj
}

resource "routeros_ip_route" "jj" {
  dst_address   = "0.0.0.0/0"
  gateway       = "10.0.0.6"
  check_gateway = "none"
}

import {
  id = "*80000157"
  to = routeros_ip_route.vx
}

resource "routeros_ip_route" "vx" {
  dst_address   = "0.0.0.0/0"
  gateway       = "10.0.0.2"
  check_gateway = "none"
}

import {
  id = "*8000016B"
  to = routeros_ip_route.z1
}

resource "routeros_ip_route" "z1" {
  dst_address   = "0.0.0.0/0"
  gateway       = "10.0.0.4"
  check_gateway = "none"
}


import {
  id = "*8000017E"
  to = routeros_ip_route.z1-1
}

resource "routeros_ip_route" "z1-1" {
  dst_address   = "192.168.99.0/24"
  gateway       = "10.0.0.4"
  check_gateway = "none"
}
