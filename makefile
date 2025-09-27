.PHONY: run

install:
	ansible-galaxy install -r requirements.yaml
	ansible-galaxy collection install -r requirements.yaml

.run:
	if [ -z "$(environment)" ]; then echo "Please specify an environment, e.g., make dev-server"; exit 1; fi
	./run.sh $(environment)

dev-server:
	./run.sh dev-server \
		--hostname=$(hostname) \
		--remote=$(user)

zigbee-station:
	./run.sh zigbee-station \
		--hostname=$(hostname) \
		--remote=$(user)

k3s-node:
	./run.sh k3s-node \
		--tags=$(tags) \
		--hostname=$(hostname) \
		--remote=$(user)
