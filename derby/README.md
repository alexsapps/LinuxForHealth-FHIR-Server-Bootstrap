# LinuxForHealth FHIR Server with Derby DB

Builds on fhir-server/ directory to run with Derby as the FHIR database.

## Running on your developer machine

One time only, run the powershell script:

`/fhir-server/docker-network-create.ps1`.

At least once, and each time after making any relevant configuration changes, run:

`/fhir-server/docker-build.ps1`.

Then create and start the server:

```powershell
docker-create-if-not-exists.ps1
docker-start-fhir-server-and-attach.ps1
```

You can make configuration changes by running `docker-fhir-server-ssh.ps1` and using a text editor to edit configuration
files, then restarting by hitting ctrl+c on the server and running the start-and-attach script again.

The Derby database files and any configuration changes made by SSH-ing into the container are saved (persisted) across
runs using this technique.

### Running without persistence

If you want to get a fresh start every time you run the server, you can use
`./docker-run-fhir-server-no-persistence.ps1`. Using this script, when the container is stopped, it will be removed;
this avoids cluttering your list of stopped containers in Docker. All data will be lost and each time you start the
server it will have to reinitialize the (temporary) database. Running this script will not affect the storage of any
container you created with the other scripts, but you will have issues with port conflicts if you try to run the server
using both methods at the same time.
