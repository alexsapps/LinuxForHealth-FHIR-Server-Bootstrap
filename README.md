# LinuxForHealth FHIR Server Starter Project

This project demonstrates using [LinuxForHealth FHIR Server](https://github.com/LinuxForHealth/FHIR) with minimal
configuration to importing synthetic data from Synthea and set up a Postgres database. Much of the set up is automated
with help from Docker and Powershell. The entire process of getting the server running is just a matter of running
our Powershell scripts in the right order.

The official documentation for setting up Linux For Health is in their
[User's Guide](https://linuxforhealth.github.io/FHIR/guides/FHIRServerUsersGuide).

## Run with Derby configuration

See our [README for Derby](derby/README.md) for instructions on running the FHIR server with the default Derby database.
This is the simplest option, but viewing the database yourself is more difficult and this use case is less realistic
as Derby is not suitable for production.

## Run with Postgres configuration

See our [README for Postgres](postgres/README.md) for instructions on running the FHIR server with a Postgres database.

## Generating and importing test data with Synthea

See our [Synthea README](synthea/README.md) for instructions on generating test data and importing it to LinuxForHealth
FHIR server.
