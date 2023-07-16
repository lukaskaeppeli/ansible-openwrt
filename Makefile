list:
	@echo "Available targets:"
	@echo
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

install-dependencies:
	ansible-galaxy install gekmihesg.openwrt

apply_sftp: install-dependencies
	ansible-playbook -i inventory sftp.yml --diff

check_adblock: install-dependencies
	ansible-playbook -i inventory adblock.yml --check --diff

apply_adblock: install-dependencies
	ansible-playbook -i inventory adblock.yml --diff

apply_dhcp: install-dependencies
	ansible-playbook -i inventory dhcp.yml --diff

check_network: install-dependencies
	ansible-playbook -i inventory network.yml --check --diff

apply_network: install-dependencies
	ansible-playbook -i inventory network.yml --diff

check_dhcp: install-dependencies
	ansible-playbook -i inventory dhcp.yml --check --diff

check_wireless: install-dependencies
	ansible-playbook -i inventory wireless.yml --check --diff

apply_wireless: install-dependencies
	ansible-playbook -i inventory wireless.yml --diff

check_wireguard: install-dependencies
	ansible-playbook -i inventory wireguard.yml --check --diff

apply_wireguard: install-dependencies
	ansible-playbook -i inventory wireguard.yml --diff

check_node_exporter: install-dependencies
	ansible-playbook -i inventory node_exporter.yml --check --diff

apply_node_exporter: install-dependencies
	ansible-playbook -i inventory node_exporter.yml --diff

apply: install-dependencies
	ansible-playbook -i inventory site.yml --diff