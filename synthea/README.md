# Synthea

Synthea is a project to generate synthetic FHIR resources. This may be useful, for example, to populate a FHIR server
for testing its behavior.

External instructions: https://github.com/synthetichealth/synthea/wiki/Basic-Setup-and-Running

## Downloading and running Synthea

Download and run as follows:

```
synthea/download-jar.ps1
synthea/generate-resources.ps1
```

The the 2nd script will create NDJSON files in a subdirectory of this one called `output`.

Note, Synthea recommends CSV format for ETL purposes generally, but FHIR server `$import` endpoint requires `ndjson`
format so we've configured settings.txt to generate ndjson files.

## Importing Synthea data to FHIR server

See [Import Synthea output to LinuxForHealth FHIR Server](./import-to-LFH-FHIR.md).
