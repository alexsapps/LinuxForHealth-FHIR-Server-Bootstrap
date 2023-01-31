# CD to git repo root
Set-Location "$(git rev-parse --show-toplevel)" -ErrorAction Stop

./fhir-server/docker-network-create.ps1

./fhir-server/docker-build.ps1
