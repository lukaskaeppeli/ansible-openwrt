# Network Role

## Description
The network role configures basic network settings on your devices. It removes existing WAN, WAN6, and LAN interfaces, sets up a new LAN interface with static IP configuration, modifies DNS settings for the LAN interface, stops and disables the firewall and odhcpd services, and adjusts dnsmasq settings to ignore DHCP requests.

## Requirements
- Ansible 2.9 or higher
- Network interface with UCI support

## Role Variables
- `ansible_host`: The static IP address assigned to the LAN interface.
- `network.gateway`: The gateway IP address for the network.

## Dependencies
None

## Example Playbook
```yaml
- hosts: all
  roles:
    - role: network
      vars:
        ansible_host: "192.168.1.1"
        network_gateway: "192.168.1.254"
