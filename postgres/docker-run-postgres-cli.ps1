# Run postgres CLI.
#
# Prerequisite: Postgres is running via `docker-run-postgres.ps1`.
#
# Recommended to run after connecting:
#   SET search_path TO fhirdata;

docker container run --rm -it `
    <# Put on the same network as the container that is actually running the Postgres server #> `
    --network fhir-server-network `
    -e PGHOST=PostgresForLfhFhirServer `
    -e PGDATABASE=fhirdb `
    -e PGPASSWORD=mysecretpassword `
    -e PGUSER=postgres `
    postgres:15-alpine `
    psql `
    $args
