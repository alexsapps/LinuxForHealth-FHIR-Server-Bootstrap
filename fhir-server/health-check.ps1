# Invoke-RestMethod requires the server to have a valid certificate.
# If the server is not configured with a valid cert, consider Postman or a web browser.
# Note: HTTP status code 200 indicates success; empty response body (blank page) is expected.

Invoke-RestMethod 'https://fhiruser:change-password@localhost:9443/fhir-server/api/v4/$healthcheck' -Method 'GET' -Headers $headers

Exit $LASTEXITCODE
