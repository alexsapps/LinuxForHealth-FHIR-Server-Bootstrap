# Synthea

Synthea is a project to generate synthetic FHIR resources. This may be useful, for example, to populate a FHIR server for testing its behavior.

External instructions: https://github.com/synthetichealth/synthea/wiki/Basic-Setup-and-Running

## Downloading and running

This VS Code workspace defines tasks for downloading and running Synthea. To view and run the tasks, type ctrl+P to open the command pallet, and then type `task Synthea`; alternatively click `Terminal` -> `Run Task...`.

This task will create CSV files in a subdirectory of this one called `output`. Note, Synthea recommends CSV format for ETL purposes.
