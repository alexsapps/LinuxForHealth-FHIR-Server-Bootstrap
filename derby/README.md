# LinuxForHealth FHIR Server with Derby DB

Builds on fhir-server/ directory to run with Derby as the FHIR database.

## Running on your developer machine

Prerequisite: One time only, run the powershell script `/fhir-server/docker-network-create.ps1`. At least once, and
each time after making any relevant configuration changes, run `/fhir-server/docker-build.ps1`.

This VS Code workspace defines tasks for downloading and running LinuxForHealth FHIR Server with Derby. To view and run
the tasks, type ctrl+P to open the command pallet, and then type `task FHIR Server:`; alternatively click `Terminal` ->
`Run Task...`. To view the commands, open [tasks.json](.vscode/tasks.json).

The tasks assume you intend to reuse the same container, rather than re-create the container each time and using a
volume for persistence of data. (I have not yet tried to persist Derby's data in a Docker volume.)

If you don't mind the database being wiped out when the container stops, you may use the script
`derby/docker-run-fhir-server-with-derby.ps1`.