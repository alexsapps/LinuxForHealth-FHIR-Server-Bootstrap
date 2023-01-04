FROM ghcr.io/linuxforhealth/fhir-server

# Custom FHIR server configuration
COPY ./fhir-server-config.json ./config/default/fhir-server-config.json

# Trust the Certificate Authority (CA) of your HTTPS server.
COPY ./CA.pem.tmp ./docker-host-CA.pem

# `fhirServer/bulkdata/core/api/truststore` setting in `fhir-server-config.json` points to this trust store below
# (fhirTrustStore.p12).
RUN keytool -import \
    -alias DockerHostCA \
    -file ./docker-host-CA.pem \
    -storetype PKCS12 \
    -keystore ./resources/security/fhirTrustStore.p12 \
    -storepass change-password \
    -trustcacerts \
    -noprompt
