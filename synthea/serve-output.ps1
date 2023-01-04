# CD to git repo root
Set-Location "$(git rev-parse --show-toplevel)" -ErrorAction Stop

python .\synthea\localhost-https-server.py
