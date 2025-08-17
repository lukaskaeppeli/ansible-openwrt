# IPv6 Role

## Description
The ipv6 role configures IPv6 settings on your network devices. It sets WAN6 settings, disables SLAAC (Stateless Address Autoconfiguration) on the LAN interface, and configures the LAN interface with specific IPv6 parameters.

## Requirements
- Ansible 2.9 or higher
- Network interface with UCI support

## Role Variables
None specified in this role's tasks.

## Dependencies
None

## Example Playbook
```yaml
- hosts: all
  roles:
    - role: ipv6
```