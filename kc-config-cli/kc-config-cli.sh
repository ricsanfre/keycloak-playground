#!/bin/bash


init()
{
KEYCLOAK_URL="https://keycloak.minas-morgul.home.ricsanfre.com"
KEYCLOAK_USER="admin"
KEYCLOAK_PASSWORD="s1cret0"
DOCKER_IMAGE="adorsys/keycloak-config-cli:latest"
}

init


docker run \
    -e KEYCLOAK_URL="$KEYCLOAK_URL" \
    -e KEYCLOAK_USER="$KEYCLOAK_USER" \
    -e KEYCLOAK_PASSWORD="$KEYCLOAK_PASSWORD" \
    -e KEYCLOAK_SSLVERIFY=true \
    -e KEYCLOAK_AVAILABILITYCHECK_ENABLED=true \
    -e KEYCLOAK_AVAILABILITYCHECK_TIMEOUT=120s \
    -e IMPORT_VARSUBSTITUTION_ENABLED=true \
    -e IMPORT_FILES_LOCATIONS='/config/*' \
    --env-file ./.env \
    -v ./realm-config:/config \
    $DOCKER_IMAGE