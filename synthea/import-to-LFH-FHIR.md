
# Import Synthea output to LinuxForHealth FHIR Server

## 0. Prerequisites

* FHIR server container already running in Docker (see [../README.md](../README.md) for more info).
* Synthea output directory contains generated `*.ndjson` files (see [README.md](README.md) for more info).

## 1.5 Tell FHIR server to trust your CA

Copy the CA cert into the container:

```powershell
docker cp <path>\CA.pem <your container name>:/opt/ol/wlp/usr/servers/defaultServer/docker-host-CA.pem
```

Then SSH into the container (consider using the SSH task defined in this project).

Once logged into the container, verify that the `fhirServer/bulkdata/core/api/truststore` setting in `fhir-server-config.json` points to the trust store file in the following command, and then run that command to import the CA public key to this trust store:

```bash
keytool -import -alias DockerHostCA -file ./docker-host-CA.pem -storetype PKCS12 -keystore resources/security/fhirTrustStore.p12
```

When prompted for the password to this trust store, enter password `change-password`. When asked whether to trust the certificate, type `yes`.

Now you should see `dockerhostca` alias when you view the keystore: `keytool -list -keystore resources/security/fhirTrustStore.p12`

Restart the docker container to ensure the trust store is reloaded.

## 2. Start file server

Start the HTTPS Python file server:

```bash
python .\\synthea\\localhost-https-server.py
```

## 3. Configure HTTPS import option in LinuxForHealth

In the LFH FHIR server, edit the file `config/default/fhir-server-config.json` (in `wlp/usr/servers/defaultServer/`) (in the case of docker, to access this file use `docker exec` or the SSH task defined in this project). In the file, add a storage provider configuration in the
`storageProviders` JSON object:

```json
"storageProviders": {
    "https": {
        "type": "https",
        "validBaseUrls": ["https://host.docker.internal:4443/"]
    },
    "default": {...}
}
```

## 4. Call the import endpoint

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