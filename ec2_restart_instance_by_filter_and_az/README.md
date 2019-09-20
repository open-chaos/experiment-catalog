# Restart an [EC2][ElasticComputeCloud] instance selected by filter Chaos Experiment

This experiment explores whether my application can maintain itself when an [EC2][ElasticComputeCloud] instance is restarted, when it is selected by a filter.

[ElasticComputeCloud]: https://aws.amazon.com/ec2/

## Setup for Experiment Execution

### Install the Chaos Toolkit

This experiment uses the [free and open source Chaos Toolkit][chaostoolkit]. The instructions for installing the [Chaos Toolkit][chaostoolkit] are available in the [project's documentation][docs].

[chaostoolkit]: https://chaostoolkit.org/
[docs]: https://docs.chaostoolkit.org

### Install Any Required Drivers

The [Chaos Toolkit][chaostoolkit] is extended by adding [drivers]. This experiment requires the following drivers:

* Chaos Toolkit Extension for AWS [aws-driver] [aws-driver-github]

[drivers]: https://docs.chaostoolkit.org/drivers/overview/
[aws-driver]: https://docs.chaostoolkit.org/drivers/aws/
[aws-driver-github]: https://github.com/chaostoolkit-incubator/chaostoolkit-aws

## Running the Experiment

### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `APPLICATION_ENTRYPOINT_URL` - Specifies the application entry point URL where your application can be reached in your environment.
  * `INSTANCE_ID` - The id of the instance that will be stopped using a filter.
  * `AVAILABILITY_ZONE` - The availability region of the instance that will be stopped.

## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          export INSTANCE_ID=i-1234567890abcdef0; \
          export AVAILABILITY_ZONE=eu-west-2 ; \
          chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/aws/ec2_restart_instance_by_filter_and_az/ec2_restart_instance_by_filter_and_az.json
```

***NOTE:*** The APPLICATION_ENTRYPOINT_URL, INSTANCE_ID and the AVAILABILITY_ZONE should be setup according to your AWS run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp \
           -e INSTANCE_ID=i-1234567890abcdef0 \
           -e AVAILABILITY_ZONE=eu-west-2 \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
            chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/aws/ec2_restart_instance_by_filter_and_az/ec2_restart_instance_by_filter_and_az.json
```

### Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp; \
          export INSTANCE_ID=i-1234567890abcdef0; \
          export AVAILABILITY_ZONE=eu-west-2 ; \
          chaos run ec2_restart_instance_by_filter_and_az.json
```

***NOTE:*** The APPLICATION_ENTRYPOINT_URL, INSTANCE_ID and the AVAILABILITY_ZONE should be setup according to your AWS run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e APPLICATION_ENTRYPOINT_URL=http://192.168.99.100/myapp \
           -e INSTANCE_ID=i-1234567890abcdef0 \
           -e AVAILABILITY_ZONE=eu-west-2 \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
             chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run ec2_restart_instance_by_filter_and_az.json
```
