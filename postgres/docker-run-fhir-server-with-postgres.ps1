# Runs the FHIR server configured to connect to Postgres DB

docker container run `
    <# remove container after exiting (a best practice. data is not lost as it's stored in the Volume.) #> `
    --rm `
    <# forward signals #> `
    -it `
    <# arbitrary name for this container #> `
    --name ProofOfConceptLfhFhirServerConfiguredForPostgres `
    <# make port accessible from host/laptop #> `
    -p 9443:9443 `
    <# network, same as Postgres server so they can communicate #> `
    --network fhir-server-network `
    <# allow connections from container to host/laptop #> `
    --add-host host.docker.internal:host-gateway `
    <# specify the LinuxForHealth container image #> `
    proof-of-concept-lfh-fhir-server-configured-for-postgres `
    <# forward any arguments of this PowerShell script into the container process #> `
    $args

Exit $LASTEXITCODE
