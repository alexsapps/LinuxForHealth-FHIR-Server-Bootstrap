# Runs a Postgres server.

# Data is preserved between runs in a Volume. To reset the database, delete the volume.

# Create a container volume (if one does not already exist) to store database files outside the container.
docker volume create lfh-fhir-server-postgres-db-volume
if ($LASTEXITCODE -ne 0) { Exit $LASTEXITCODE }

# Start the Postgres server.
docker container run `
    <# remove container after exiting (a best practice. data is not lost as it's stored in the Volume.) #> `
    --rm `
    <# forward signals #> `
    -it `
    <# arbitrary name for this container #> `
    --name PostgresForLfhFhirServer `
    <# network, same as FHIR server so they can communicate #> `
    --network fhir-server-network `
    <# make port accessible from host/laptop #> `
    -p 5432:5432 `
    <# define the password #> `
    -e POSTGRES_PASSWORD=mysecretpassword `
    <# define the database name #> `
    -e POSTGRES_DB=fhirdb `
    <# define path for Postgres to store data files in the container #> `
    -e PGDATA=/var/lib/postgresql/data/pgdata `
    <# map the directory containing data files to the Volume #> `
    -v lfh-fhir-server-postgres-db-volume:/var/lib/postgresql/data `
    <# in Postgres package, choose Alpine linux distro to save space without loss of functionality.
       Documentation here: https://hub.docker.com/_/postgres #> `
    postgres:15-alpine `
    <# forward any arguments of this PowerShell script into the container process #> `
    $args

Exit $LASTEXITCODE
