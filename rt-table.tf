import {
  id = "*400"
  to = routeros_routing_table.edw
}

resource "routeros_routing_table" "edw" {
  name = "EDW"
  fib  = true
}

import {
  id = "*401"
  to = routeros_routing_table.jj
}

resource "routeros_routing_table" "jj" {
  name = "J&J"
  fib  = true
}

import {
  id = "*403"
  to = routeros_routing_table.vx
}

resource "routeros_routing_table" "vx" {
  name = "VX"
  fib  = true
}

import {
  id = "*404"
  to = routeros_routing_table.z1
}

resource "routeros_routing_table" "z1" {
  name = "Z1"
  fib  = true
}

