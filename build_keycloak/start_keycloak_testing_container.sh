#!/bin/bash

cd /Users/alex/Work/Projects/xix-apps/keycloakify-test/build_keycloak

docker rm keycloak-testing-container || true

docker build . -t keycloakify-test/keycloak-hot-reload

docker run \
	-p 8080:8080 \
	--name keycloak-testing-container \
	-e KEYCLOAK_USER=admin \
	-e KEYCLOAK_PASSWORD=admin \
	-v /Users/alex/Work/Projects/xix-apps/keycloakify-test/build_keycloak/src/main/resources/theme/keycloakify-test:/opt/jboss/keycloak/themes/keycloakify-test:rw \
	-it keycloakify-test/keycloak-hot-reload:latest
