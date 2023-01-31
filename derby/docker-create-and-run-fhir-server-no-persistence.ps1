# Starts a fresh instance of FHIR server with Derby.
#
# ALL FHIR DATA IS LOST after the container stops, as this script runs `docker container run --rm ...` with no Docker
# volumes. To preserve Derby data, use `docker create`, `docker start` and `docker stop` commands.
#
# Prerequisite: Image built with `fhir-server/docker-build.ps1`


docker container run `
    <# remove container after exiting (a best practice. data is not lost as it's stored in the Volume.) #> `
    --rm `
    <# forward signals #> `
    -it `
    <# arbitrary name for this container #> `
    --name ProofOfConceptLfhFhirServerConfiguredForDerby `
    <# make port accessible from host/laptop #> `
    -p 9443:9443 `
    <# allow connections from container to host/laptop #> `
    --add-host host.docker.internal:host-gateway `
    <# auto set up Derby database #> `
    -e BOOTSTRAP_DB=true `
    <# specify the image name defiend in the build script #> `
    proof-of-concept-lfh-fhir-server `
    <# forward any arguments of this PowerShell script into the container process #> `
    $args

Exit $LASTEXITCODE
