#!/bin/sh -l
set -e
set -o pipefail

curl -sL https://github.com/oam-dev/kubevela/releases/download/v0.0.8/vela-v0.0.8-linux-amd64.tar.gz | \
  tar xz && mv linux-amd64/vela /usr/local/bin/vela && chmod +x /usr/local/bin/vela 

echo ${KUBE_CONFIG_DATA} | base64 -d > kubeconfig
export KUBECONFIG=kubeconfig

echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin


vela system update
vela up 
