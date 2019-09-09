# Simple "file must be retained on deployment" chaos experiment

This experiment explores whether a required local file is present before and after a deployment. It is a _very_ simple sample experiment that, in fact, does very little other than provide an example.

## Setup for Running this Experiment

### Install the Chaos Toolkit

This experiment uses the [free and open source Chaos Toolkit][chaostoolkit]. The instructions for installing the [Chaos Toolkit][chaostoolkit] are available in the [project's documentation][docs].

[chaostoolkit]: https://chaostoolkit.org/
[docs]: https://docs.chaostoolkit.org

### Install Any Required Drivers

There are no required Chaos Toolkit [drivers][] for this experiment.

[drivers]: https://docs.chaostoolkit.org/drivers/overview/

## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using 
`docker`.

With the native `chaos` command:

```bash
(chaostk) $ chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/file-must-not-disappear/file-must-not-disappear.json
```

With `docker`:

```bash
$ docker run -it \
           -v `pwd`:/tmp/result \
           -v /Users/russellmiles/.chaostoolkit:/tmp/settings \
           quay.io/chaosiq/chaostoolkit-cloud:0.1 \
           --settings /tmp/settings/settings.yaml \
           run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/file-must-not-disappear/file-must-not-disappear.json
```


## Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command, or using 
`docker`. You may execute it from the 

With the native `chaos` command:

```bash
(chaostk) $ chaos run file-must-not-disappear.json
```

With `docker`:

```bash
$ docker run -it \
           -v `pwd`:/tmp/result \
           -v /Users/russellmiles/.chaostoolkit:/tmp/settings \
           quay.io/chaosiq/chaostoolkit-cloud:0.1 \
           --settings /tmp/settings/settings.yaml \
           run file-must-not-disappear.json
```
