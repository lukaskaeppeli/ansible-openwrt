# DHCP Role

## Description
The dhcp role configures DHCP settings on your network devices. It sets a local domain for DNS resolution, deletes old static leases, and configures static clients with specific IP addresses, MAC addresses, DNS settings, and DUIDs.

## Requirements
- Ansible 2.9 or higher
- Network interface with UCI support

## Role Variables
- `network.local_domain`: The local domain to be set for DHCP.
- `network.static_clients`: A list of dictionaries defining static client configurations. Each dictionary should include:
  - `hostname`: The hostname of the client.
  - `ip`: The IP address assigned to the client.
  - `mac`: The MAC address of the client.
  - `duid` (optional): The DHCP Unique Identifier for the client.

## Dependencies
None

## Example Playbook
```yaml
- hosts: all
  roles:
    - role: dhcp
      vars:
        network_local_domain: "example.local"
        network_static_clients:
          - hostname: "client1"
            ip: "192.168.1.10"
            mac: "AA:BB:CC:DD:EE:FF"

          - hostname: "client2"
            ip: "192.168.1.11"
            mac: "11:22:33:44:55:66"
