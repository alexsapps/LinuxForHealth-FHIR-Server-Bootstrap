# Makes a request to the health check endpoint of the FHIR server to test that it's up and running.

# Tip: you can click the "Import" button in Postman and paste this CURL command into the "Raw text" tab.

curl --insecure --location --request GET 'https://fhiruser:change-password@localhost:9443/fhir-server/api/v4/$healthcheck'
