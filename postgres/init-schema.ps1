# Script based on instructions from https://github.com/LinuxForHealth/FHIR/tree/main/fhir-persistence-schema

# Prerequisites:
#  - FHIR server is NOT running
#  - Postgres server is running

# CD to git repo root
Set-Location "$(git rev-parse --show-toplevel)" -ErrorAction Stop

.\postgres\docker-build-fhir-server-with-postgres.ps1
if (-Not $?) { Exit }

.\postgres\docker-run-fhir-server-with-postgres.ps1 java -jar `
   /opt/fhir-server/tools/fhir-persistence-schema-5.1.1-cli.jar `
   --db-type postgresql `
   --prop-file postgres-fhir-db.properties `
   --schema-name fhirdata `
   --create-schemas
if (-not $?) { Exit 1 }

# Note: Use `--grant-to` to allow a non-admin user to access the schema
.\postgres\docker-run-fhir-server-with-postgres.ps1 java -jar `
   /opt/fhir-server/tools/fhir-persistence-schema-5.1.1-cli.jar `
  --db-type postgresql `
  --prop-file postgres-fhir-db.properties `
  --schema-name fhirdata `
  --update-schema `
  --pool-size 1
if (-not $? ) { Exit 1 }
