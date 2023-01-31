# LinuxForHealth FHIR Server with Postgres DB

Note: this code directory builds on top of the ../fhir-server/ directory to run with Postgres as the FHIR database.

## Prerequisites

### Create docker network

One time only, if you haven't already, create the Docker network shared by the FHIR server and Postgres DB

```powershell
./fhir-server/docker-network-create.ps1
```

### Set up Postgres DB

Run standalone Postgres server and then initialize the database for use by the FHIR server (create FHIR tables)

```powershell
./postgres/docker-run-postgres.ps1
./postgres/init-schema.ps1
```

## Start FHIR server

Run the FHIR server configured to use the Postgres DB:

```powershell
./postgres/docker-run-fhir-server.ps1
```

Hit the [health check](../fhir-server/health-check/) endpoint to test the database.

## View database tables

Open the Postgres CLI:

```powershell
./postgres/docker-run-postgres-cli.ps1
```

In the Postgres CLI, enter these commands:

```psql
-- Set default schema to fhirdata
SET search_path TO fhirdata;

-- Show everything
\d
```
