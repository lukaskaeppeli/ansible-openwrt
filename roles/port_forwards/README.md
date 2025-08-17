# Port Forwards Role

## Description
The port_forwards role configures port forwarding rules on your network firewall. It sets up redirect sections in the firewall configuration for specified protocols, source addresses, ports, and destination IP addresses.

## Requirements
- Ansible 2.9 or higher
- Network interface with UCI support

## Role Variables
- `network.port_forwards`: A list of dictionaries specifying port forwarding rules. Each dictionary should include:
  - `name`: The name of the rule.
  - `protocol`: The protocol to use (e.g., tcp, udp).
  - `src`: The source address or network.
  - `port`: The port number to forward.
  - `dest_ip_v4`: The destination IPv4 address.

## Dependencies
None

## Example Playbook
```yaml
- hosts: all
  roles:
    - role: port_forwards
      vars:
        network_port_forwards:
          - name: "http_forward"
            protocol: "tcp"
            src: "lan"
            port: "80"
            dest_ip_v4: "192.168.1.100"

          - name: "https_forward"
            protocol: "tcp"
            src: "lan"
            port: "443"
            dest_ip_v4: "192.168.1.101"
