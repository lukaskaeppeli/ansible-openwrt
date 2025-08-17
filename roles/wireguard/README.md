# WireGuard Role

## Description
The wireguard role sets up a WireGuard VPN on your network devices. It installs necessary packages, configures firewall settings, removes pre-existing network configurations, and sets up both network and peer configurations for the VPN.

## Requirements
- Ansible 2.9 or higher
- Network interface with UCI support

## Role Variables
- `wireguard.clients`: A list of dictionaries specifying client configurations. Each dictionary should include:
  - Client-specific configuration details required by WireGuard.

## Dependencies
None

## Example Playbook
```yaml
- hosts: all
  roles:
    - role: wireguard
      vars:
        wireguard_clients:
          - name: "client1"
            # Add client-specific variables here

          - name: "client2"
            # Add client-specific variables here
