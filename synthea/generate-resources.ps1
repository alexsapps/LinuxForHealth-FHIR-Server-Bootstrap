# CD to this directory
Set-Location "$(git rev-parse --show-toplevel)/synthea" -ErrorAction Stop

java -jar ./bin/synthea-with-dependencies.jar -c ./settings.txt -p 5
