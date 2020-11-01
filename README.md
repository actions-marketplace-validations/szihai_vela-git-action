# Demo github action of Kubevela

**This github action is for demo purposes only.**

## What does it do

This github action will use Kubevela to deploy the workloads defined in an [Appfile](https://github.com/oam-dev/kubevela/blob/master/docs/design/appfile-design.md) onto a Kubernetes cluster.

## Prerequisite

To use it, you will need:

* Create a github secret named `KUBECONFIG`. Here is an example on how to encode your Kubeconfig: `cat ~/.kube/config | base64`
* Have a vela.yaml file on your code repository. This file will be passed to the github action. In this repo there is a somple vela.yaml file.
  
## How to use it

To use it, simply create or add the steps into your workflow file under `.github/workflows`. Here is an example:
```
on: push
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run vela
        uses: szihai/vela-git-action@v0.3-alpha
        env:
          KUBE_CONFIG_DATA: ${{ secrets.KUBECONFIG }}
        with:
          args: vela.yaml
```
