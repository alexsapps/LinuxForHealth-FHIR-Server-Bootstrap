# Opens an shell in a container configured to run FHIR server with Postgres DB.
# This does not actually run the FHIR server.
#
# Prerequisite: Image built with `postgres/docker-build-fhir-server.ps1`

# CD to git repo root
Set-Location "$(git rev-parse --show-toplevel)" -ErrorAction Stop

docker container run `
    --rm <# remove container after exiting (a best practice. data is not lost as it's stored in the Volume.) #> `
    -it <# forward signals #> `
    --network fhir-server-network <# network, same as Postgres server so they can communicate #> `
    proof-of-concept-lfh-fhir-server-configured-for-postgres <# image name #> `
    /bin/sh <# open a shell #>
