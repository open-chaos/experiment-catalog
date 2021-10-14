# Auto Heal Restores application when instance is stopped Chaos Experiment

This experiment explores whether my application can restore itself when a named [EC2][ElasticComputeCloud] instance is stopped. This EC2 instance is configured with [AWS OpsWorks][AwsOpsWorks] which includes in its Layers settings an Option to Auto-Heal auto healing is documented [here][instsnceAutoHeal]. The instance is setup by following these steps [Getting started with Linux stacks][linuxGettingStarted]. If the instance is stopped it will auto-heal after about 5 minutes, so the experiment has a 6 minute pause after the last step.

[ElasticComputeCloud]: https://aws.amazon.com/ec2/
[AwsOpsWorks]: https://docs.aws.amazon.com/opsworks/index.html
[instsnceAutoHeal]: https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autohealing.html
[linuxGettingStarted]: https://docs.aws.amazon.com/opsworks/latest/userguide/gettingstarted-linux.html

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

### Boto Configuring Credentials

The Chaos Toolkit Extension for AWS uses [Boto3][boto3] which has a number of
options to [configure AWS credentials][credconfig] you need to ensure you have
configured the credentials correctly to get the AWS extension to work.

[boto3]: https://boto3.amazonaws.com/v1/documentation/api/latest/index.html
[credconfig]: https://boto3.amazonaws.com/v1/documentation/api/latest/index.html

### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `EC2_INSTANCE_ID` - The id of the instance that will be stopped.
  * `AVAILABILITY_ZONE` - The availability zone of the instance
  * `AWS_REGION` - The AWS Region must be specified to use the Chaostoolkit extension for AWS
  * `AWS_ACCESS_KEY_ID` - One way configuring AWS credentials
  * `AWS_SECRET_ACCESS_KEY` - One way configuring AWS credentials

## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export EC2_INSTANCE_ID=my_ec2_instance_id; \
          export AVAILABILITY_ZONE=us-west-2; \
          export AWS_REGION=us-west-2; \
          export AWS_ACCESS_KEY_ID=ABCD*****; \
          export AWS_SECRET_ACCESS_KEY=ABCD**********xx; \
          chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/aws/OpsWorks/ow_ec2_auto_heal_single_instance_service.json
```

***NOTE:*** The  EC2_INSTANCE_ID, AVAILABILITY_ZONE & AWS_REGION should be setup according to your AWS run time environment. AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY environment variables is one way of configuring aws access when using the Chaostoolkit AWS extension. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e EC2_INSTANCE_ID=my_ec2_instance_id \
           -e AVAILABILITY_ZONE=us-west-2; \
           -e AWS_REGION=us-west-2; \
           -e AWS_ACCESS_KEY_ID=ABCD*****; \
           -e AWS_SECRET_ACCESS_KEY=ABCD**********xx; \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
            chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/aws/OpsWorks/ow_ec2_auto_heal_single_instance_service.json
```

### Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export EC2_INSTANCE_ID=my_ec2_instance_id; \
          export AVAILABILITY_ZONE=us-west-2; \
          export AWS_REGION=us-west-2; \
          export AWS_ACCESS_KEY_ID=ABCD*****; \
          export AWS_SECRET_ACCESS_KEY=ABCD**********xx; \
          chaos run ec2_stop_instance_by_id_experiment.json
```

***NOTE:*** The  EC2_INSTANCE_ID, AVAILABILITY_ZONE & AWS_REGION should be setup according to your AWS run time environment. AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY environment variables is one way of configuring aws access when using the Chaostoolkit AWS extension. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e EC2_INSTANCE_ID=my_ec2_instance_id \
           -e AVAILABILITY_ZONE=us-west-2; \
           -e AWS_REGION=us-west-2; \
           -e AWS_ACCESS_KEY_ID=ABCD*****; \
           -e AWS_SECRET_ACCESS_KEY=ABCD**********xx; \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
             chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run ec2_stop_instance_by_id_experiment.json
```
