# Opens an shell in a container configured to run FHIR server with Postgres DB.
# This does not actually run the FHIR server.

# CD to git repo root
Set-Location "$(git rev-parse --show-toplevel)" -ErrorAction Stop

./postgres/docker-run-fhir-server-with-postgres.ps1 /bin/sh
