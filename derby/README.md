# LinuxForHealth FHIR Server with Derby DB

Builds on fhir-server/ directory to run with Derby as the FHIR database.

## Running on your developer machine

Prerequisite: One time only, run the powershell script `/fhir-server/docker-network-create.ps1`. At least once, and
each time after making any relevant configuration changes, run `/fhir-server/docker-build.ps1`.

There are two ways to run, the simple way or the persistent way.

### The easy way

The easy way is to run this script:

`./docker-run-fhir-server-no-persistence.ps1`

When the container is stopped, it will be removed; this avoids cluttering your list of stopped containers in Docker.
All data will be lost and each time you start the server it will have to reinitialize the (temporary) database.

### The persistent way

The Derby database files and any configuration changes made by SSH-ing into the container are saved (persisted) across
runs using this technique.

```powershell
docker-create-if-not-exists.ps1
docker-start-fhir-server-and-attach.ps1
```

You can make configuration changes by running `docker-fhir-server-ssh.ps1` and using a text editor to edit configuration
files, then restarting by hitting ctrl+c on the server and running the start-and-attach script again.
