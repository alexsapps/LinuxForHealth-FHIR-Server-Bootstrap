# CD to this directory
Set-Location "$(git rev-parse --show-toplevel)/synthea" -ErrorAction Stop

mkdir ./bin -ErrorAction Stop
Invoke-WebRequest -Uri "https://github.com/synthetichealth/synthea/releases/download/master-branch-latest/synthea-with-dependencies.jar" -OutFile "./bin/synthea-with-dependencies.jar"
