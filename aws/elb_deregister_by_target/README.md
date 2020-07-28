# Stop random instance from target [ELB][ElasticComputeCloud] group Chaos Experiment

This experiment explores whether my application can maintain itself when a named target [ELB][ElasticComputeCloud] instance is stoppe from ELB.

[ElasticComputeCloud]: https://docs.aws.amazon.com/elasticloadbalancing/index.html

## Setup for Experiment Execution

### Install the Chaos Toolkit

This experiment uses the [free and open source Chaos Toolkit][chaostoolkit]. The instructions for installing the [Chaos Toolkit][chaostoolkit] are available in the [project's documentation][docs].

[chaostoolkit]: https://chaostoolkit.org/
[docs]: https://docs.chaostoolkit.org

### Install Any Required Drivers

The [Chaos Toolkit][chaostoolkit] is extended by adding [drivers]. This experiment requires the following drivers:

* Chaos Toolkit Extension for AWS [aws-driver] [aws-driver-github], make sure you are using elb_v2 apis.

[drivers]: https://docs.chaostoolkit.org/drivers/overview/
[aws-driver]: https://docs.chaostoolkit.org/drivers/aws/
[aws-driver-github]: https://github.com/chaostoolkit-incubator/chaostoolkit-aws

## Running the Experiment

### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `AWS_REGION` - Specifies the AWS Region.
  * `ELB_TARGET` - The target tag name which elb is using, where instances are attached .
  * `EC2_AZ` - Specifies the AWS Zone. 


## Running the Experiment Direct from the Catalog using HTTP

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export AWS_REGION=us-west-2; \
          export ELB_TARGET=ipfmeapp-0fbc11ffd7c782b58cb; \
          export AWS_AZ=us-west-2a; \
          chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/aws/elb_deregister_by_target/elb-deregister.json
```

***NOTE:*** The AWS_REGION and the ELB_TARGET should be setup according to your AWS run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.

With `docker`:

```bash
$ docker run -it \
           -e AWS_REGION=us-west-2 \
           -e ELB_TARGET=my_elb_target_tag \
           -e AWS_AZ=us-west-2a \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
            chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           chaos run https://raw.githubusercontent.com/open-chaos/experiment-catalog/master/aws/elb_deregister_by_target/elb-deregister.json
```

### Running the Experiment from a Local Copy

You can run this experiment using the native `chaos` command, or using
`docker`.

With the native `chaos` command:

```bash
(chaostk) export AWS_REGION=us-west-2; \
          export ELB_TARGET=my_elb_target_tag; \
          export AWS_AZ=us-west-2a; \
          chaos run elb-deregister.json
```

***NOTE:*** The AWS_REGION, AWS_AZ and the ELB_TARGET should be setup according to your AWS run time environment. The docker command also uses the .chaostoolkit/settings.yaml from the users home directory.


With `docker`:

```bash
$ docker run -it \
           -e AWS_REGION=us-west-2 \
           -e  ELB_TARGET=my_elb_target_tag \
           -e AWS_AZ=us-west-2a \
           -v `pwd`:/tmp/result \
           -v ~/.chaostoolkit:/tmp/settings \
             chaostoolkit/chaostoolkit \
           --settings /tmp/settings/settings.yaml \
           run elb-deregister.json
```
