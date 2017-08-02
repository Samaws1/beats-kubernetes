# Metricbeat

Metricbeat fetches a set of metrics on a predefined interval from the operating system and
services such as Apache web server, Redis, and more and ships them to Elasticsearch or Logstash.

To learn more about Metricbeat, check out https://www.elastic.co/products/beats/metricbeat.

## Ship metrics from Kubernetes to Elasticsearch

### Kubernetes DaemonSet

By deploying metricbeat as a [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)
we ensure we get a running metricbeat daemon on each node of the cluster.

Everything is deployed under `kube-system` namespace, you can change that by
updating YAML manifests under this folder.

### Settings

We use official [Beats Docker images](https://github.com/elastic/beats-docker),
as they allow external files configuration, a [ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
is used for kubernetes specific settings. Check [metricbeat-configmap.yaml](metricbeat-configmap.yaml)
for details.

Also, [metricbeat-daemonset.yaml](metricbeat-daemonset.yaml) uses a set of environment
variables to configure Elasticsearch output:

Variable | Default | Description
-------- | ------- | -----------
ELASTICSEARCH_SERVICE_HOST | elasticsearch | Elasticsearch host
ELASTICSEARCH_SERVICE_PORT | 9200 | Elasticsearch port
ELASTICSEARCH_USERNAME | elastic | Elasticsearch username for HTTP auth
ELASTICSEARCH_PASSWORD | changeme | Elasticsearch password

If there is an existing `elasticsearch` service in the kubernetes cluster these
defaults will use it.

### Deploy to kubernetes

To deploy metricbeat to Kubernetes just run:

```shell
$ git clone https://github.com/elastic/beats-kubernetes.git
$ kubectl create -f beats-kubernetes/metricbeat/
```

It will clone this repository and put metricbeat manifests to Kubernetes. In a
few seconds metrics should start flowing into Elasticsearch.
