# Introduce latency using the Chaos Monkey for Spring Boot

This experiment explores whether my application can robustly respond to an increase in latency, injected
using the [Chaos Monkey for Spring Boot][chaosmonkey].

[chaosmonkey]: https://codecentric.github.io/chaos-monkey-spring-boot/

## Setup for Experiment Execution

### Install the Chaos Toolkit

This experiment uses the [free and open source Chaos Toolkit][chaostoolkit]. The instructions for installing the [Chaos Toolkit][chaostoolkit] are available in the [project's documentation][docs].

[chaostoolkit]: https://chaostoolkit.org/
[docs]: https://docs.chaostoolkit.org

### Install Any Required Drivers

The [Chaos Toolkit][chaostoolkit] is extended by adding [drivers]. This experiment requires the following drivers:

* Chaos Monkey for Spring Boot driver [chaos-monkey-spring-boot-driver] [chaos-monkey-spring-boot-driver-github]

[drivers]: https://docs.chaostoolkit.org/drivers/overview/
[chaos-monkey-spring-boot-driver]: https://docs.chaostoolkit.org/drivers/spring/
[chaos-monkey-spring-boot-driver-github]: https://github.com/chaostoolkit-incubator/chaostoolkit-spring

## Running the Experiment

### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `APPLICATION_ENTRYPOINT_URL` - Specifies the application entry point URL where your application can be reached in your environment.
  *  `CHAOS_MONKEY_ACTUATOR_URL` - Specifies the service to be used to inject the latency

## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) $ export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          $ export CHAOS_MONKEY_ACTUATOR_URL=http://localhost:8080/actuator; \
                   chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/spring_boot/introduce_latency/introduce_latency_experiment.json
```

> ***NOTE:*** The APPLICATION_ENTRYPOINT_URL & CHAOS_MONKEY_ACTUATOR_URL should be setup according to your services run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp \
           -e CHAOS_MONKEY_ACTUATOR_URL=http://localhost:8080/actuator \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
           chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/spring_boot/introduce_latency/introduce_latency_experiment.json
```


### Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) $ export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          $ export CHAOS_MONKEY_ACTUATOR_URL=http://localhost:8080/actuator; \
                   chaos run introduce_latency_experiment.json
```

> ***NOTE:*** The APPLICATION_ENTRYPOINT_URL & CHAOS_MONKEY_ACTUATOR_URL should be setup according to your services run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp \
           -e CHAOS_MONKEY_ACTUATOR_URL=http://localhost:8080/actuator \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
           chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run introduce_latency_experiment.json
```
