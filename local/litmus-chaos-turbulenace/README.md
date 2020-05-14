# This Experiment Checks a URL Responds with Success (200) Status when the Webserver Container is Restarted by litmus-chaos

This experiment checks a URL responds with a success code when [litmuschaos][litmuschaos] is used to inject turbulence.

## Setup for Experiment Execution

### Install the Chaos Toolkit

This experiment uses the [free and open source Chaos Toolkit][chaostoolkit]. The instructions for installing the [Chaos Toolkit][chaostoolkit] are available in the [project's documentation][docs].

### Install litmuschaos

This experiment is going to use [litmuschaos][litmuschaos] to inject turbulent conditions as part of a [Chaos Toolkit][chaostoolkit] experiment. To do this you will need to follow the steps on the [litmus chaos getting started][litmuschaosGetStarted]. You will need a Kubernetes cluster to run this.

[chaostoolkit]: https://chaostoolkit.org/
[docs]: https://docs.chaostoolkit.org
[litmuschaos]: https://litmuschaos.io
[litmuschaosGetStarted]: https://docs.litmuschaos.io/docs/getstarted/

### Setting up an Application and a Service

In order to have something to measure with the experiment and a container to shutdown when you inject turbulence you will need an application running on you cluster. The following will setup an `nginx` hello world server:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 1
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginxdemos/hello
        ports:
        - containerPort: 80
```

This can deployed on your cluster with:

```kubectl apply -f <filename>.yaml```

Then to make the server visible externally run:

```bash
kubectl expose deployment nginx --type="LoadBalancer"
```

After a short wait you can check the service for an external IP address:

```bash
kubectl get svc nginx
NAME    TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE
nginx   LoadBalancer   10.27.252.114   34.105.191.45   80:32350/TCP   4h35m
```

Once you have the external IP address you can query the server with:

```bash
curl -I http://34.105.191.45
```

## Running the Experiment

The experiment in this case will depend on the `kubectl` command so you will need `kubectl` in your path and it needs to be connected to your cluster. If you followed the steps on the [litmus chaos getting started][litmuschaosGetStarted] you will be using the `nginx` namespace.

### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `ENDPOINT_URL` - Specifies the end point URL that is checked by the experiment.
  * `CHAOS_YAML` - Specifies the name of the YAML file that contains your litmus chaos engine experiment

  There is an example [chaos engine yaml](chaosengine.yaml) in this repo.

### Running the Experiment from a Local Copy

As in this case we have dependencies on ```kubectl``` and a `kubernetes` cluster, it's easier to run the experiment locally.

You can run this experiment using the native `chaos` command.

Note in this case we have a method in the [experiment.json](experiment.json) that is going to use a python process to run the ```kubctl apply -f```, this will cause limuschaos to inject turbulence on the server.

With the native `chaos` command:

```bash
(chaostk) ENDPOINT_URL=http://34.105.191.45  \
          CHAOS_YAML=chaosengine.yaml \
          chaos  run experiment.json
```
