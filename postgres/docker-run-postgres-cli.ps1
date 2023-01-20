# SSH into container from Postgres server image.
#
# This is useful, for example, to use the postgres CLI. (For this, be sure to initialize the database first.)

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