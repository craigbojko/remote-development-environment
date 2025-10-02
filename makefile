.PHONY: run

install:
	ansible-galaxy install -r requirements.yaml
	ansible-galaxy collection install -r requirements.yaml

/**
 * Generic Makefile to run any environment
 * - environment: dev-server, zigbee-station, k3s-node, pihole-server
 * - arguments: hostname, user, tags
 */
.run:
	if [ -z "$(environment)" ]; then echo "Please specify an environment, e.g., make dev-server"; exit 1; fi
	./run.sh $(environment)

/**
 * Makefile for RPi Dev Server
 * - dev-server
 * - arguments: hostname (default: rpi-dev-server), user (default: craig)
 */
dev-server:
	./run.sh dev-server \
		--tags=$(tags) \
		--hostname=$(or $(hostname),rpi-dev-server) \
		--remote=$(or $(user),craig)

/**
 * Makefile for Zigbee Station
 * - zigbee-station
 * - arguments: hostname (default: rpi-zigbee-station), user
 */
zigbee-station:
	./run.sh zigbee-station \
		--tags=$(tags) \
		--hostname=$(or $(hostname),rpi-zigbee-station) \
		--remote=$(user)

/**
 * Makefile for K3s Node
 * - k3s-node
 * - arguments: hostname, user
 */
k3s-node:
	./run.sh k3s-node \
		--tags=$(tags) \
		--hostname=$(hostname) \
		--remote=$(user)
