# LFH FHIR Server with Postgres DB

Builds on fhir-server/ directory to run with Postgres as the FHIR database.

## Set up Postgres DB

```powershell
# Create docker network shared by FHIR server and Postgres DB:
./fhir-server/docker-network-create.ps1
# Run standalone Postgres server:
./postgres/docker-run-postgres.ps1
# Initialize the database for use by the FHIR server (create FHIR tables)
./postgres/init-schema.ps1
```

## Start FHIR server

Run the FHIR server configured to use the Postgres DB:

```powershell
./postgres/docker-run-fhir-server.ps1
```

Hit the health check endpoint to test the database.

## View database tables

Open the CLI:

```powershell
./postgres/docker-run-postgres-cli.ps1
```

In the CLI:

```psql
-- Set default schema to fhirdata
SET search_path TO fhirdata;

-- Show everything
\d
```
