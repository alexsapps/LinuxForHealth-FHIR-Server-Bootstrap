# CD to git repo root
Set-Location "$(git rev-parse --show-toplevel)" -ErrorAction Stop

# Make CA cert available. Dockerfile cannot reference external directory.
Copy-Item ./certs/CA.pem ./fhir-server/CA.pem.tmp -ErrorAction Stop

try {
    docker build ./fhir-server -t proof-of-concept-lfh-fhir-server
    Exit $LASTEXITCODE
} finally {
    Remove-Item ./fhir-server/CA.pem.tmp
}
