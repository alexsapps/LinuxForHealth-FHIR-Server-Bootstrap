# Summarizes the list of capabilities from a capabilities.json

# CD to git repo root
Set-Location "$(git rev-parse --show-toplevel)" -ErrorAction Stop

# Fist create a file called "capabilities.json" containing the response from FHIR /metadata
# endpoint. (PowerShell script can't fetch it as it requires an HTTPS endpoint with a valid cert.)

$capabilities = Get-Content ./fhir-server/capabilities.json -Raw | ConvertFrom-Json
($capabilities.rest.resource | % {$_.type}) -Join ","
