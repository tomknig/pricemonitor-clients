#!/bin/bash

rm -rf clients
mkdir clients

API_PATH="/local/openapi.yaml"
IMAGE="openapitools/openapi-generator-cli:v4.3.1"
COMMON_PARAMS="--api-package api --model-package model --git-host github.com --git-repo-id pricemonitor-clients --git-user-id Patagona"

'docker run --rm -v $(pwd):/local -u $(id -u ${USER}):$(id -g ${USER}) $IMAGE generate \
      -i $API_PATH ${COMMON_PARAMS} \
      -g scala-akka \
      -o /local/clients/akka

docker run --rm -v $(pwd):/local -u $(id -u ${USER}):$(id -g ${USER}) $IMAGE generate \
      -i $API_PATH \
      -g scala-sttp \
      -o /local/clients/scala-sttp

docker run --rm -v $(pwd):/local -u $(id -u ${USER}):$(id -g ${USER}) $IMAGE generate \
      -i $API_PATH \
      -g scala-gatling \
      -o /local/clients/scala-gatling

docker run --rm -v $(pwd):/local -u $(id -u ${USER}):$(id -g ${USER}) $IMAGE generate \
      -i $API_PATH \
      -g scalaz \
      -o /local/clients/scalaz

docker run --rm -v $(pwd):/local -u $(id -u ${USER}):$(id -g ${USER}) $IMAGE generate \
      -i $API_PATH \
      -g java \
      -o /local/clients/java '

docker run --rm -v $(pwd):/local -u $(id -u ${USER}):$(id -g ${USER}) $IMAGE generate \
      -i $API_PATH \
      -g typescript-angular \
      -o /local/clients/typescript-angular ${COMMON_PARAMS} \
      --additional-properties=npmName=@Patagona/pricemonitor-typescript-angular \
      --additional-properties=ngVersion=10.0.0 \
      --additional-properties=npmRepository=https://npm.pkg.github.com

# The generator inserts crappy typescript boundaries which only work for angualr 9. We need to update them.

ANGULAR_PACKAGE_JSON=clients/typescript-angular/package.json
sed -i 's/\"typescript\": \">=3.6.0 <3.8.0\"/\"typescript\": \">=3.9.2 <4.0.0\"/g' ${ANGULAR_PACKAGE_JSON}
jq -M '. +{"repository": {"type" : "git","url" : "ssh://git@github.com/Patagona/pricemonitor-clients.git","directory": "packages/pricemonitor-typescript-angular"}}' ${ANGULAR_PACKAGE_JSON} > ${ANGULAR_PACKAGE_JSON}.tmp
mv ${ANGULAR_PACKAGE_JSON}.tmp ${ANGULAR_PACKAGE_JSON}
