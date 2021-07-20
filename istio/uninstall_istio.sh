#!/bin/bash

kubectl delete -f bookinfo-gateway.yaml
kubectl delete -f bookinfo-with-nodeSelector.yaml
istioctl x uninstall --purge <<EOF
Y
EOF
kube delete ns istio-system
kubectl label ns default istio-injection-

