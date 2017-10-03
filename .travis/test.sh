#!/bin/bash
set -e

# Create all manifests
make all

# TODO Run Elasticsearch service
#sudo sysctl vm.max_map_count=262144
#kubectl run elasticsearch --namespace=kube-system --image=docker.elastic.co/elasticsearch/elasticsearch:6.0.0-rc1 --env="discovery__type=single-node" --env="ES_JAVA_OPTS=-Xmx400m" --env="bootstrap__memory_lock=false"
#kubectl expose deploy elasticsearch --namespace=kube-system --port=9200 --type=NodePort

# Deploy manifests
TIMEOUT_COUNT=20
for FILE in $(ls *-kubernetes.yaml); do
  BEAT=$(echo $FILE | cut -d \- -f 1)
  kubectl create -f $FILE
done
