# Check a URL endpoint responds with 200 status

This experiment checks a url endpoint is reachable


## Setup for Experiment Execution

### Install the Chaos Toolkit

This experiment uses the [free and open source Chaos Toolkit][chaostoolkit]. The instructions for installing the [Chaos Toolkit][chaostoolkit] are available in the [project's documentation][docs].

[chaostoolkit]: https://chaostoolkit.org/
[docs]: https://docs.chaostoolkit.org

### Install Any Required Drivers

The [Chaos Toolkit][chaostoolkit] is extended by adding [drivers]. This experiment does not require any additional drivers.

[drivers]: https://docs.chaostoolkit.org/drivers/overview/

## Running the Experiment

### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `ENDPOINT_URL` - Specifies the end point url that is checked by the experiment

## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export ENDPOINT_URL=https://httpstat.us/200?sleep=2000; \
          chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/local/url-responds/url-responds.json
```

***NOTE:*** The ENDPOINT_URL should be set to the url you are going to test. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e ENDPOINT_URL=https://httpstat.us/200?sleep=2000 \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
            chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/local/url-responds/url-responds.json
```

### Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export ENDPOINT_URL=https://httpstat.us/200?sleep=2000 \
          chaos run url-responds.json
```

***NOTE:*** The ENDPOINT_URL should be set to the url you are going to test. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.


With `docker`:

```bash
$ docker run -it \
           -e ENDPOINT_URL=https://httpstat.us/200?sleep=2000 \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
             chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run url-responds.json
```
