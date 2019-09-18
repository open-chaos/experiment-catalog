# Stop a random Azure Kubernetes node

This experiment explores whether my application can maintain itself when a named random Azure Kubernetes node is stopped.

## Setup for Experiment Execution

### Install the Chaos Toolkit

This experiment uses the [free and open source Chaos Toolkit][chaostoolkit]. The instructions for installing the [Chaos Toolkit][chaostoolkit] are available in the [project's documentation][docs].

[chaostoolkit]: https://chaostoolkit.org/
[docs]: https://docs.chaostoolkit.org

### Install Any Required Drivers

The [Chaos Toolkit][chaostoolkit] is extended by adding [drivers]. This experiment requires the following drivers:

* Kubernetes Chaos Toolkit Driver [kubernetes-driver] [kubernetes-driver-github]

[drivers]: https://docs.chaostoolkit.org/drivers/overview/
[kubernetes-driver]: https://docs.chaostoolkit.org/drivers/kubernetes/
[kubernetes-driver-github]: https://github.com/chaostoolkit/chaostoolkit-kubernetes

## Running the Experiment

### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `APPLICATION_ENTRYPOINT_URL` - Specifies the application entry point URL where your application can be reached in your environment.
  *  `POD_LABEL` - Specifies the label used to identify the pod that you are going to delete.
  *  `NODE_NAME` - Specifies the name of the node that will be deleted.

## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          export AZURE_SUBSCRIPTION_ID=mysubscriptionid ; \
          export AZURE_CLIENT_ID=myclientid ; \
          export AZURE_CLIENT_SECRET=myclientsecret ; \
          export AZURE_TENANT_ID=mytenantid ; \
                   chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/azure-aks-stop-random-node/stop-random-node-experiment.json
```

***NOTE:*** The APPLICATION_ENTRYPOINT_URL should be setup according to your Kubernetes run time environment. The AZURE_SUBSCRIPTION_ID, AZURE_CLIENT_ID, AZURE_CLIENT_SECRET and AZURE_TENANT_ID should be setup according to your Azure settings. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
          -e APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp \
          -e AZURE_SUBSCRIPTION_ID=mysubscriptionid  \
          -e AZURE_CLIENT_ID=myclientid  \
          -e AZURE_CLIENT_SECRET=myclientsecret  \
          -e AZURE_TENANT_ID=mytenantid  \
          -v `pwd`:/tmp/result \
          -v ~/.chaostoolkit:/tmp/settings \
          chaostoolkit/chaostoolkit \
          --settings /tmp/settings/settings.yaml \
          run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/azure-aks-stop-random-node/stop-random-node-experiment.json


### Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          export AZURE_SUBSCRIPTION_ID=mysubscriptionid ; \
          export AZURE_CLIENT_ID=myclientid ; \
          export AZURE_CLIENT_SECRET=myclientsecret ; \
          export AZURE_TENANT_ID=mytenantid ; \
          chaos run stop-random-node-experiment.json
```

***NOTE:*** The APPLICATION_ENTRYPOINT_URL should be setup according to your Kubernetes run time environment. The AZURE_SUBSCRIPTION_ID, AZURE_CLIENT_ID, AZURE_CLIENT_SECRET and AZURE_TENANT_ID should be setup according to your Azure settings. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.
With `docker`:

```bash
$ docker run -it \
          -e APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp \
          -e AZURE_SUBSCRIPTION_ID=mysubscriptionid  \
          -e AZURE_CLIENT_ID=myclientid  \
          -e AZURE_CLIENT_SECRET=myclientsecret  \
          -e AZURE_TENANT_ID=mytenantid  \
          -v `pwd`:/tmp/result \
          -v ~/.chaostoolkit:/tmp/settings \
          chaostoolkit/chaostoolkit \
          --settings /tmp/settings/settings.yaml \
          run stop-random-node-experiment.json
```
