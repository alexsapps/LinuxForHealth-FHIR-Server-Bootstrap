# Starts the FHIR server with Derby configuration. The container is kept around after it stops (no --rm flag passed to
# Docker). The filesystem contains the Derby database files, so data is saved.
#
# Prerequisite: `docker-create-if-not-exists.ps1`

docker container start -i --attach ProofOfConceptLfhFhirServerConfiguredForDerby
