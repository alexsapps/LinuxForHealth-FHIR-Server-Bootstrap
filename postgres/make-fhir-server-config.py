# Saves a copy of fhir-server-config.json from fhir-server directory modified to use Postgres database for persistence.
#
# Must be run from the git repo root.

import json

def configure_postgres(config):
    config['fhirServer']['persistence']['datasources']['default'] = {
        "type": "postgresql",
        "currentSchema": "fhirdata",
    }
    return config

def load():
    with open('./fhir-server/fhir-server-config.json') as file:
        return json.load(file)

def save(config):
    with open('./postgres/fhir-server-config-generated.json', 'w') as outfile:
        json.dump(config, outfile)

config = load()
configure_postgres(config)
save(config)
