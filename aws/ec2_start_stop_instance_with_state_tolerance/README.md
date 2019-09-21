# Stop and start a filtered [EC2][ElasticComputeCloud] instance Chaos Experiment

This experiment explores whether an instance is restarted automatically.

This demonstrates how to use a rich tolerance which looks into the instance's
state. 

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
  * `EC2_INSTANCE_ID` - The id of the instance that will be stopped/started.

## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export EC2_INSTANCE_ID=i-1234567890abcdef0; \
          chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/aws/ec2_start_stop_instance_with_state_tolerance/ec2_start_stop_instance_with_state_tolerance.json
```

***NOTE:*** The EC2_INSTANCE_ID should be setup according to your AWS run time
environment. The docker command also uses the .chaostoolkit/settings.yaml from
the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e  EC2_INSTANCE_ID=i-1234567890abcdef0 \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
            chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/aws/ec2_start_stop_instance_with_state_tolerance/ec2_start_stop_instance_with_state_tolerance.json
```

### Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export EC2_INSTANCE_ID=i-1234567890abcdef0; \
          chaos run ec2_start_stop_instance_with_state_tolerance.json
```

***NOTE:*** The EC2_INSTANCE_ID should be setup according to your AWS run
time environment. The docker command also uses the .chaostoolkit/settings.yaml
from the users home directory.


With `docker`:

```bash
$ docker run -it \
           -e  EC2_INSTANCE_ID=i-1234567890abcdef0 \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
             chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run ec2_start_stop_instance_with_state_tolerance.json
```
