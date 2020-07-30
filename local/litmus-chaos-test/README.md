# This Experiment Checks a URL Responds with Success (200) Status when the Webserver Container is restarted with litmus-chaos

This experiment checks a URL responds with a success code when [litmuschaos][litmuschaos] is used to restart the container.

## Setup for Experiment Execution

### Install the Chaos Toolkit

This experiment uses the [free and open source Chaos Toolkit][chaostoolkit]. The instructions for installing the [Chaos Toolkit][chaostoolkit] are available in the [project's documentation][docs].

### Install litmuschaos

This experiment is going to use [litmuschaos][litmuschaos] to inject turbulent conditions as part of a [Chaos Toolkit][chaostoolkit] experiment. To do this you will need to follow the steps on the [litmus chaos getting started][litmuschaosGetStarted]. You will need a Kubernetes cluster to run this.

[chaostoolkit]: https://chaostoolkit.org/
[docs]: https://docs.chaostoolkit.org
[litmuschaos]: https://litmuschaos.io
[litmuschaosGetStarted]: https://docs.litmuschaos.io/docs/getstarted/
[litmus-python]: https://github.com/litmuschaos/litmus-python
[litmus-chaos]: https://hub.litmuschaos.io/chaostoolkit

### Setting up an Application and a Service

In order to have something to measure with the experiment and a container to shutdown when you delete pod you will need an application running on you cluster. The following will setup an `nginx` hello world server:

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

The experiment in this case will depend on the `kubectl` command so you will need `kubectl` in your path and it needs to be connected to your cluster. If you followed the steps on the [litmus chaos getting started][litmuschaosGetStarted] you will be using the `default` namespace, where you install the above nginx deployment.

### Setup the Experiment Custom Resource

This Experiment requires the following custom resource to be setup as experiment, with right RBAC along with a chaosengine, which trigger this chaos

* `https://hub.litmuschaos.io/chaostoolkit/k8-pod-delete` 

### Required Parameters

This experiment requires the following parameters:

* Environment Variables
  * `APP_ENDPOINT` - Specifies the end point URL that is checked by the experiment, specify in chaosengine.yaml
  * `NAME_SPACE` - Specifies the pod you want to delete on given namespace, specify in chaosengine.yaml
  * `LABEL_NAME` - Specifies the label you will use to delete the pod, specify in chaosengine.yaml

  There are many an examples [chaos engine and experiments](https://github.com/litmuschaos/chaos-charts/tree/master/charts/chaostoolkit/k8-pod-delete) in this repo.

### Running the Experiment from a Local Copy

As in this case we have dependencies on ```kubectl``` and a `kubernetes` cluster, it's easier to run the experiment locally.

* Execution
  * Apply experiments for k8 `kubectl apply experiment.yaml` 
  * Setup RBAC `kubectl apply rbac.yaml`
  * Apply engine for pod delete `kubectl create chaosengine.yaml` 

* Cleanup
  * Remove engine for pod delete `kubectl delete experiment.yaml`
  * Remove RBAC `kubectl delete rbac.yaml`
  * Remove experiments for k8 `kubectl delete chaosengine.yaml`


