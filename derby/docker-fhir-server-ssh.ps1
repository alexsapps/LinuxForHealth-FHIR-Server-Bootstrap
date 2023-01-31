# SSH into the existing container created with "docker create".
#
# Prerequisite: `docker-create-if-not-exists.ps1`

docker container exec -it ProofOfConceptLfhFhirServerConfiguredForDerby /bin/sh
