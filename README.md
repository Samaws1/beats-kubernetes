# Beats Kubernetes manifests examples


## Beats - The Lightweight Shippers of the Elastic Stack

The [Beats](https://www.elastic.co/products/beats) are lightweight data
shippers, written in Go to capture all sorts of operational data (think of
logs, metrics, or network packet data). The Beats send the operational data to
Elasticsearch, either directly or via Logstash, so it can be visualized with
Kibana.

By "lightweight", we mean that Beats have a small installation footprint, use
limited system resources, and have no runtime dependencies.

## Getting started

This is the list officially supported Beats, with manifests:

This repository contains manifests files for:

Beat | Description
--- | ---
 [filebeat](filebeat)|Tails and ships logs
