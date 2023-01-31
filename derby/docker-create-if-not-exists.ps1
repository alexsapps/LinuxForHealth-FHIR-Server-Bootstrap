# Create docker container for FHIR server configured to use Derby.
#
# This creates a container named `ProofOfConceptLfhFhirServerConfiguredForDerby` from the image `proof-of-concept-lfh-fhir-server`.
#
# Prerequisite: ./fhir-server/docker-build.ps1
# Prerequisite: ./fhir-server/docker-network-create.ps1


# Use `--add-host host.docker.internal:host-gateway` to make the Docker host (your localhost) available via hostname
# `host.docker.internal` inside the container.
docker container create --name ProofOfConceptLfhFhirServerConfiguredForDerby -p 9443:9443 --add-host host.docker.internal:host-gateway -e BOOTSTRAP_DB=true proof-of-concept-lfh-fhir-server