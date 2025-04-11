# Keycloak Playground

Repository containing keycloak playground built with the examples from Book "Keycloak Identity and Access Management for Modern Applications 2nd edition"


## Traefik as external Reverse Proxy

Traefik is configured as a Reverse Proxy for all applications
Proper LetsEncrypt certificates are generated (IONOS DNS challenge used)

See https://github.com/ricsanfre/home-services/tree/master/traefik-proxy


## About sample code applications

Sample code forked from https://github.com/PacktPublishing/Keycloak---Identity-and-Access-Management-for-Modern-Applications-2nd-Edition

Backend applications are developed using Nodejs and using [Keycloak Nodejs adapter](https://www.keycloak.org/docs/latest/securing_apps/#_nodejs_adapter)

Sample code have been adapted to be used with new release of Keycloak (26.1.4) and to run using docker compose

## Starting Keycloak

### Start traefik proxy

Start docker host traefik proxy. https://github.com/ricsanfre/home-services/tree/master/traefik-proxy

### Start keycoak and playground applications

```shell
docker compose up -d
```

### Import realm configuration

```shell
cd kc-config-cli
docker compose up
```
