
# Import Synthea output to LinuxForHealth FHIR Server

## 1. Create Synthea data

If you haven't already, make sure the Synthea output directory contains generated `*.ndjson` files; see [README.md](README.md) for more info.

## 2. Start file server

Start the HTTPS Python file server:

```bash
python .\\synthea\\localhost-https-server.py
```

## 3. Start the FHIR server

Make one of our FHIR server containers is already running in Docker; see [../README.md](../README.md) for more info.

The scripts in this project launch a FHIR server that is preconfigured to trust our certificate authority (CA) with
public key file in certs\CA.pem, and configured the import mechanism specifically to allow using our HTTPS server via
`https://host.docker.internal:4443/` in the "storageProviders" section of our configuration in
`fhir-server\fhir-server-config.json`.

## 4. Call the import endpoint

See the [Bulk Data Guide](https://linuxforhealth.github.io/FHIR/guides/FHIRBulkOperations) for external instructions.

Run this `CURL` command directly, or alternatively, use Postman's "Import" button and paste the CURL command into the "Raw text" tab.

```bash
curl --location --request POST 'https://localhost:9443/fhir-server/api/v4/$import' \
--header 'Content-Type: application/fhir+json' \
--header 'X-FHIR-BULKDATA-PROVIDER: https' \
--header 'Authorization: Basic ZmhpcnVzZXI6Y2hhbmdlLXBhc3N3b3Jk' \
--data-raw '{
    "resourceType": "Parameters",
    "id": "<optional field - enter some GUID here as idempotency key>",
    "parameter": [
        {
            "name": "inputFormat",
            "valueString": "application/fhir+ndjson"
        },
        {
            "name": "inputSource",
            "valueUri": "https://host.docker.internal:4443/"
        },
        {
            "name": "input",
            "part": [
                {
                    "name": "type",
                    "valueString": "Patient"
                },
                {
                    "name": "url",
                    "valueUrl": "https://host.docker.internal:4443/Patient.ndjson"
                }
            ]
        },
        {
            "name": "storageDetail",
            "valueString": "https"
        }
    ]
}'
```

This imports `Patient` resources only. Only one resource type can be imported per call.

Create and execute similar requests for other resource types as needed besides `Patient`.

## 5. Check import status

Check the `Content-Location` header of the HTTP response from the `$import` operation. Send a GET request to the URL given in the value of this header. HTTP 202 means the job is still in progress and HTTP 200 means it's done.