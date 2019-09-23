# Delete a Kubernetes Node Game Day Chaos Experiment

This directory contains a collection of automated experiments that aid in the execution 
of a Game Day that explores the impacts and reactions to Kubernetes node deletion.

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

## Running the Game Day

A Game Day involves two distinct stages, setup and teardown. Each phase has its own automation experiment script, or scripts.

### Setting up for the Game Day

Setting up the Game Day involves ensuring the system is recognizably "normal", using an appropriate Steady-State Hypothesis, and then injecting the turbulent conditions desired that will explore the 
impacts and reactions during the Game Day.

This Game Day contains a single `game_day_setup.json` chaos experiment that completes these actions.

#### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `APPLICATION_ENTRYPOINT_URL` - Specifies the application entry point URL where your application can be reached in your environment.
  *  `NODE_NAME` - Specifies the name of the node that will be deleted.

#### Running the Game Day setup Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) $ export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          $ export NODE_NAME=mynode; \
                   chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/kubernetes/game_day_drain_named_node/game_day_setup.json
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
           run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/kubernetes/game_day_drain_named_node/game_day_setup.json
```


#### Running the Game Day setup from a Local Copy

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) $ export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          $ export NODE_NAME=mynode; \
                   chaos game_day_setup.json
```

> ***NOTE:*** The APPLICATION_ENTRYPOINT_URL, POD_LABEL & NODE_NAME should be setup according to your Kubernetes run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp \
           -e NODE_NAME=mynode \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
             chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run game_day_setup.json
```

### Tearing down the Game Day

Tearing down the Game Day involves ensuring the system is recognizably "normal" again using the experiment's method to reverse the turbulent 
conditions injected in the Game Day setup.

This Game Day contains a single `game_day_teardown.json` chaos experiment that completes these actions.

#### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `APPLICATION_ENTRYPOINT_URL` - Specifies the application entry point URL where your application can be reached in your environment.
  *  `NODE_NAME` - Specifies the name of the node that will be deleted.

#### Running the Game Day teardown Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) $ export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          $ export NODE_NAME=mynode; \
                   chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/kubernetes/game_day_drain_named_node/game_day_teardown.json
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
           run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/kubernetes/game_day_drain_named_node/game_day_teardown.json
```


#### Running the Game Day teardown from a Local Copy

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) $ export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          $ export NODE_NAME=mynode; \
                   chaos game_day_teardown.json
```

> ***NOTE:*** The APPLICATION_ENTRYPOINT_URL, POD_LABEL & NODE_NAME should be setup according to your Kubernetes run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp \
           -e NODE_NAME=mynode \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
             chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run game_day_teardown.json
```
