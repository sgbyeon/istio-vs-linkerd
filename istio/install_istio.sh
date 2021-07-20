#!/bin/bash

istioctl install --set profile=demo -y
kubectl label namespace default istio-injection=enabled
kubectl apply -f bookinfo-with-nodeSelector.yaml
kubectl apply -f bookinfo-gateway.yaml
istioctl analyze
