# Introduce latency using Toxiproxy

This experiment explores whether my application can robustly respond to an increase in latency, injected
using the [Toxiproxy][toxiproxy].

[toxiproxy]: http://toxiproxy.io

## Setup for Experiment Execution

### Install the Chaos Toolkit

This experiment uses the [free and open source Chaos Toolkit][chaostoolkit]. The instructions for installing the [Chaos Toolkit][chaostoolkit] are available in the [project's documentation][docs].

[chaostoolkit]: https://chaostoolkit.org/
[docs]: https://docs.chaostoolkit.org

### Install Any Required Drivers

The [Chaos Toolkit][chaostoolkit] is extended by adding [drivers]. This experiment requires the following drivers:

* Toxiproxy driver [toxiproxy-driver] [toxiproxy-driver-github]

[drivers]: https://docs.chaostoolkit.org/drivers/overview/
[toxiproxy-driver]: https://docs.chaostoolkit.org/drivers/toxiproxy/
[toxiproxy-driver-github]: https://github.com/chaostoolkit-incubator/chaostoolkit-toxiproxy

## Running the Experiment

### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `APPLICATION_ENTRYPOINT_URL` - Specifies the application entry point URL where your application can be reached in your environment.
  * `TOXIPROXY_HOST` - Specifies Toxiproxy URL where the toxiproxy is running.
  * `TOXIPROXY_PROXY_NAME` - Specifies the toxy name

## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using `docker`.

With the native `chaos` command:

```bash
(chaostk) $ export APPLICATION_ENTRYPOINT_URL=http://localhost:5000/api/airports; \
            export TOXIPROXY_HOST=localhost; \
            export TOXIPROXY_PROXY_NAME=mysql; \
                   chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/toxiproxy/introduce_latency/introduce_latency_experiment.json
```

> ***NOTE:*** The APPLICATION_ENTRYPOINT_URL, TOXIPROXY_HOST & TOXIPROXY_PROXY_NAME should be setup according to your services run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e APPLICATION_ENTRYPOINT_URL=http://localhost:5000/api/airports; \
           -e TOXIPROXY_HOST=localhost \
           -e TOXIPROXY_PROXY_NAME=mysql \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
           chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/toxiproxy/introduce_latency/introduce_latency_experiment.json
```


### Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command, or using `docker`.

With the native `chaos` command:

```bash
(chaostk) $ export APPLICATION_ENTRYPOINT_URL=http://localhost:5000/api/airports; \
            export TOXIPROXY_HOST=localhost; \
            export TOXIPROXY_PROXY_NAME=mysql; \
                   chaos run introduce_latency_experiment.json
```

> ***NOTE:*** The APPLICATION_ENTRYPOINT_URL, TOXIPROXY_HOST & TOXIPROXY_PROXY_NAME should be setup according to your services run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e APPLICATION_ENTRYPOINT_URL=http://localhost:5000/api/airports; \
           -e TOXIPROXY_HOST=localhost \
           -e TOXIPROXY_PROXY_NAME=mysql \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
           chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run introduce_latency_experiment.json
```

## Note

Due to the [issue #15][issue#15] in the the chaos toolkit toxiproxy driver, based on the chaos toolikit library [issue #137][issue#137], the latency and jitter are hardcoded. Once they are fixed, the experiment will be updated in order to be parametrized.  

[issue#15]: https://github.com/chaostoolkit-incubator/chaostoolkit-toxiproxy/issues/15
[issue#137]: https://github.com/chaostoolkit/chaostoolkit-lib/issues/137