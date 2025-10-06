import {
  id="*18"
  to=routeros_interface_list_member.proxmox
}
resource "routeros_interface_list_member" "proxmox" {
  interface = "Proxmox"
  list      = routeros_interface_list.LAN.name
}

import {
  id="*16"
  to=routeros_interface_list_member.management
}
resource "routeros_interface_list_member" "management" {
  interface = "Management"
  list      =  routeros_interface_list.LAN.name
}

import {
  id="*19"
  to=routeros_interface_list_member.server
}
resource "routeros_interface_list_member" "server" {
  interface = "Server"
  list      =  routeros_interface_list.LAN.name
}

