# OpenWRT Ansible Roles Collection
This repository contains a collection of reusable [Ansible](https://docs.ansible.com/) roles that can be used to automate the setup of [OpenWRT](https://openwrt.org/) routers. The main usecase is setting up a primary router with some dumb access points alongside. By including the [ansible-openwrt role](https://github.com/gekmihesg/ansible-openwrt), the roles are kept quite simple

## Roles
The following roles are currently available in this repository:

### sftp
Installs `openssh-sftp-server` using raw commands to get [ansible-openwrt](https://github.com/gekmihesg/ansible-openwrt) running.

### adblock
Installs `adblock`and `luci-app-adblock` before configuring the blocklists defined in the variables `adblock.adb_sources` and `adblock.adb_stb_sources`

### network
Setting up dumb access points according to the [OpenWRT documentation](https://openwrt.org/docs/guide-user/network/wifi/dumbap)

### dhcp
Sets up the primary router with all defined hostnames and static leases. Requires them to be defined as follows:

```
network:
  local_domain: home
  static_clients:
    - hostname: "host"
      mac: "XX:XX:XX:XX:XX"
      ip: 192.168.X.Y
```

The host will then be accessible under host.home.

### Wireless
It performs three operations, including adding new wifi interfaces, setting the country code, and enabling the interfaces, and commits the changes. Important, this role enables fast roaming.

### Wireguard
This is a more complex role. Based on the defined `wireguard.clients`, for each peer a configuration file is generated within a `target` directory. Further, each peer is configured on the primary router including the required firewall rules and networking configurations.

## Requirements
To use these roles, you'll need wireguard installed locally.


## Usage
Simple playbooks are already defined and can be used by executing `make apply_site` for example. Take a look at the makefile to get a list of available options.

### Sample inventory
```
openwrt:
  children:
      primary:
        hosts:
          router1_name:
            ansible_host: 192.168.X.Y
            ansible_user: root
            ansible_connection: ssh
      dumb_ap:
        hosts:
          router2_name:
            ansible_host: 192.168.X.Y
            ansible_user: root
            ansible_connection: ssh
```

Define the available wireless devices for each host:

```
wireless_devices:
    - radio0
    - radio1
```

Required group_vars:
```
network:
  local_domain: home
  static_clients:
    - hostname: "name"
      mac: "XX:XX:XX:XX:XX:XX"
      ip: 192.168.X.Y

dyndns: "xyz.dyndns."

wireless:
  ssid: 'House LANister'
  key: 'please-change-me'
  encryption: 'psk2'

wireguard:
  interface: "wg0"

  server:
    ipv4: "192.168.X.Y"
    port: "51820"

  clients:
    - name: "myPhone"
      owner: "me"
      ipv4: "192.168.X.Y"


adblock:
  adb_sources:
  adb_stb_sources:
```    


## Contributing
Contributions to this repository are welcome! If you have an idea for a new role, or if you find a bug in an existing role, please create a new issue in this repository or submit a pull request with your changes.