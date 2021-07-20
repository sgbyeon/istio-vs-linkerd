#!/bin/bash

istioctl install --set profile=demo -y
kubectl label namespace default istio-injection=enabled
#kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f samples/bookinfo/platform/kube/bookinfo-with-nodeSelector.yaml
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
istioctl analyze
