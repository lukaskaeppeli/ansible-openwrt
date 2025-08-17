# Adblock Role

## Description
The adblock role sets up ad blocking on your network devices. It installs necessary packages for ad blocking and configures custom ad block sources using UCI commands.

## Requirements
- Ansible 2.9 or higher
- Network interface with package management capabilities (opkg)

## Role Variables
- `adblock.adb_sources`: A string containing the URLs of ad block source lists to be used.
- `adblock.adb_stb_sources`: A string containing the URLs of ad block source lists specifically for set-top boxes.

## Dependencies
None

## Example Playbook
```yaml
- hosts: all
  roles:
    - role: adblock
      vars:
        adblock_adb_sources: "https://example.com/adblock.list"
        adblock_adb_stb_sources: "https://example.com/stb-adblock.list"
