# Config
PODNAME := showcase
PG_USER := postgres
PG_PASS := postgres

# Helper
--guard-%:
	@if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set: $*=abc123 make $(MAKECMDGOALS)"; \
		exit 1; \
	fi

# Podman
pd-machine-init:
	@podman machine init --memory=8192 --cpus=4

pd-machine-start:
	@podman machine start

pd-machine-stop:
	@podman machine stop

pd-machine-rm:
	@podman machine rm

pd-machine-recreate: pd-machine-rm pd-machine-init pd-machine-start

pd-postgres:
	@podman run -dit --name postgres --pod=$(PODNAME) \
		-e POSTGRES_USER=$(PG_USER) \
		-e POSTGRES_PASSWORD=$(PG_PASS) \
		docker.io/library/postgres:15

pd-pod-create:
	@podman pod create -n $(PODNAME) --network bridge \
		-p 5432:5432

pd-pod-rm:
	@podman pod rm -f $(PODNAME)

pd-pod-recreate: pd-pod-rm pd-pod-create

pd-init: pd-machine-init pd-machine-start pd-pod-create

pd-start: pd-postgres
