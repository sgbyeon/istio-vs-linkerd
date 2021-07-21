#!/bin/bash

kubectl delete -f bookinfo-gateway.yaml
kubectl delete -f bookinfo-with-nodeSelector.yaml

istioctl x uninstall --purge <<EOF
Y
EOF

kubectl delete ns istio-system

kubectl label ns default istio-injection-
