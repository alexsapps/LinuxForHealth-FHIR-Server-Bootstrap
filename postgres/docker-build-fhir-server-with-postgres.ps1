# CD to git repo root
Set-Location "$(git rev-parse --show-toplevel)" -ErrorAction Stop

./fhir-server/docker-build.ps1
if (-Not $?) { Exit 1 }

docker build ./postgres -t proof-of-concept-lfh-fhir-server-configured-for-postgres

Exit $LASTEXITCODE
