import {
  to = routeros_ip_dhcp_client.wan
  id = "*6"
}
resource "routeros_ip_dhcp_client" "wan" {
  interface = "ether1"
}

import {
  to = routeros_ip_address.Management
  id = "*14"
}

resource "routeros_ip_address" "Management" {
  address   = "192.168.62.1/24"
  interface = routeros_interface_bridge.bridge.name
  network   = "192.168.62.0"
}

import {
  to = routeros_interface_vlan.CCTV
  id = "*B"
}

resource "routeros_interface_vlan" "CCTV" {
  interface = "Management"
  name      = "IOT/CCTV"
  vlan_id   = 11
}

import {
  to = routeros_interface_vlan.Proxmox
  id = "*22"
}

resource "routeros_interface_vlan" "Proxmox" {
  interface = "Management"
  name      = "Proxmox"
  vlan_id   = 50
}

import {
  to = routeros_interface_vlan.Server
  id = "*23"
}

resource "routeros_interface_vlan" "Server" {
  interface = "Management"
  name      = "Server"
  vlan_id   = 51
}

import {
  to = routeros_interface_vlan.Storage
  id = "*24"
}

resource "routeros_interface_vlan" "Storage" {
  interface = "Management"
  name      = "Storage"
  vlan_id   = 52
}

/* LAN DHCP */

import {
    to = routeros_ip_pool.LAN
    id = "*158"
}

resource "routeros_ip_pool" "LAN" {
  name   = "LAN"
  ranges = ["192.168.62.2-192.168.62.254"]
}

import {
    to = routeros_ip_dhcp_server_network.dhcp
    id = "*1"
}
resource "routeros_ip_dhcp_server_network" "dhcp" {
  address    = "192.168.62.0/24"
  gateway    = "192.168.62.1"
  dns_server = ["1.1.1.1"]
}

import {
    to = routeros_ip_dhcp_server.LAN
    id = "*1"
}

resource "routeros_ip_dhcp_server" "LAN" {
  name         = "LAN"
  address_pool = routeros_ip_pool.LAN.name
  interface    = routeros_interface_bridge.bridge.name
}

/* CCTV */

import {
    to = routeros_ip_pool.CCTV
    id = "*2"
}

resource "routeros_ip_pool" "CCTV" {
  name   = "CCTV"
  ranges = ["192.168.11.2-192.168.11.254"]
}

import {
    to = routeros_ip_dhcp_server_network.CCTV
    id = "*2"
}
resource "routeros_ip_dhcp_server_network" "CCTV" {
  address    = "192.168.11.0/24"
  gateway    = "192.168.11.1"
  dns_server = ["1.1.1.1"]
}


import {
    to = routeros_ip_dhcp_server.CCTV
    id = "*2"
}

resource "routeros_ip_dhcp_server" "CCTV" {
  name         = "CCTV"
  address_pool = routeros_ip_pool.CCTV.name
  interface    = routeros_interface_vlan.CCTV.name
}





