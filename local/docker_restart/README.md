# Stateless service in Docker container will respond as expected after container restart

This experiment explores whether my stateless service running in a [Docker] container will respond as expected after a [docker container restart][dockerRestart].

[Docker]: https://www.docker.com
[dockerRestart]: https://docs.docker.com/engine/reference/commandline/restart/

## Setup for Experiment Execution

### Install the Chaos Toolkit

This experiment uses the [free and open source Chaos Toolkit][chaostoolkit]. The instructions for installing the [Chaos Toolkit][chaostoolkit] are available in the [project's documentation][docs].

[chaostoolkit]: https://chaostoolkit.org/
[docs]: https://docs.chaostoolkit.org

### Install Any Required Drivers

The [Chaos Toolkit][chaostoolkit] is extended by adding [drivers]. This experiment does not require any drivers.

[drivers]: https://docs.chaostoolkit.org/drivers/overview/

## Running the Experiment

### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `APPLICATION_ENTRYPOINT_URL` - The url endpoint where the service can be accessed.
  * `DOCKER_CONTAINER_NAME` - The name used for the docker container

## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command.

With the native `chaos` command:

```bash
(chaostk) export APPLICATION_ENTRYPOINT_URL=http://localhost:8080/dt; \
          export DOCKER_CONTAINER_NAME=demo_starlette; \
          chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/local/docker_restart/docker_restart.json
```

***NOTE:*** The  APPLICATION_ENTRYPOINT_URL & DOCKER_NAME should be setup according to your run time environment.

### Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command.

With the native `chaos` command:

```bash
(chaostk) export APPLICATION_ENTRYPOINT_URL=http://localhost:8080/dt; \
          export DOCKER_CONTAINER_NAME=demo_starlette; \
          chaos run docker_restart.json
```

***NOTE:*** The  APPLICATION_ENTRYPOINT_URL & DOCKER_NAME should be setup according to your run time environment.
