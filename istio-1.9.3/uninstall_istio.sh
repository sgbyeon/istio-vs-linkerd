#!/bin/bash

kubectl delete -f samples/bookinfo/networking/bookinfo-gateway.yaml
kubectl delete -f samples/bookinfo/platform/kube/bookinfo.yaml
istioctl x uninstall --purge <<EOF
Y
EOF
kube delete ns istio-system
kubectl label ns default istio-injection-

