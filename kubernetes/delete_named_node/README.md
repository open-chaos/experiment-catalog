# Delete a Kubernetes Node Chaos Experiment

This experiment explores whether my application can maintain itself when a named Kubernetes node is deleted.

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
  *  `NODE_NAME` - Specifies the name of the node that will be deleted.

## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) $ export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          $ export NODE_NAME=mynode; \
                   chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/kubernetes/delete_named_node/delete_named_node_exeriment.json
```

> ***NOTE:*** The APPLICATION_ENTRYPOINT_URL & NODE_NAME should be setup according to your Kubernetes run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp \
           -e NODE_NAME=mynode \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
            chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/kubernetes/delete_named_node/delete_named_node_exeriment.json
```
```


### Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) $ export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          $ export NODE_NAME=mynode; \
          chaos run delete_named_node_exeriment.json
```

> ***NOTE:*** The APPLICATION_ENTRYPOINT_URL & NODE_NAME should be setup according to your Kubernetes run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp \
           -e NODE_NAME=mynode \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
             chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run delete_named_node_exeriment.json
```
