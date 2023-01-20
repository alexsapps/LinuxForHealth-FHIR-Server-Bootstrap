FROM proof-of-concept-lfh-fhir-server

COPY ./fhirdb.properties ./postgres-fhir-db.properties
COPY ./fhir-server-config-generated.json ./config/default/fhir-server-config.json
COPY ./postgres-liberty-config-override.xml ./configDropins/overrides/datasource-postgresql.xml
